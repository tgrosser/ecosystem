#!/bin/bash -e
source /etc/ces/functions.sh

# Installuser and should be generated
FQDN=$(get_fqdn)
ADMUSR="scmadmin"
ADMPW="scmadmin"
ADMINGROUP=$(get_config admin_group)
AUTOUPDATE="1"
MAILFROM="cloudoguscm@cloudogu.com"
RELAYHOST="postfix"
EXTRAPLUGINS=""

# create truststore, which is used in the default file
create_truststore.sh /opt/scm-server/conf/truststore.jks > /dev/null

# Install Redmine plugin if Redmine has started already
REDMINEKEY=$(etcdctl --peers $(cat /etc/ces/node_master):4001 ls /dogu/redmine |wc -l)
if [ "$REDMINEKEY" == "1" ]; then
	EXTRAPLUGINS=$EXTRAPLUGINS$'\nscm-redmine-plugin'
fi

/opt/scm-server/bin/scm-server &
echo "INFO: Waiting for scm-manager app to show up .."
wget -q -o /dev/null -t 20 --timeout=10 --connect-timeout=10 --read-timeout=10 --retry-connrefused --waitretry=10 "http://localhost:8080/scm/" || kill $!

# Plugin installation start
# get plugin state (json) and list of installed and available plugins
pluginState=$(/usr/bin/curl -s "http://localhost:8080/scm/api/rest/plugins/overview.json" -u "$ADMUSR":"$ADMPW")
pluginAvail=$(/usr/bin/curl -s "http://localhost:8080/scm/api/rest/plugins/available.json" -u "$ADMUSR":"$ADMPW")
echo "================ plugin installation loop ================"
for i in $(cat /opt/scm-server/conf/pluginlist)$EXTRAPLUGINS; do
	echo "================== installing $i plugin =================="
	version=$(echo "$pluginState" | jq ".[] | select (.name==\"$i\") | .version" --raw-output)
	groupId=$(echo "$pluginState" | jq ".[] | select (.name==\"$i\") | .groupId" --raw-output)
	state=$(echo "$pluginState" | jq ".[] | select (.name==\"$i\") | .state" --raw-output)
	versionAvail=$(echo "$pluginAvail" | jq ".[] | select (.name==\"$i\") | .version" --raw-output)
	echo "=========================================================="
	echo "Plugin :$i"
	echo "Version: $version"
	echo "availableVersion: $versionAvail"
	echo "Vendor: $groupId"
	echo "Status: $state"
	echo "=========================================================="
	# PLUGIN NOT INSTALLED --> INSTALL
	if [ "$state" == "AVAILABLE" ]; then
		/usr/bin/curl -s -X POST "http://localhost:8080/scm/api/rest/plugins/install/$groupId:$i:$version" -u "$ADMUSR":"$ADMPW"
		echo "===================== installed $i ======================="
	else
	# PLUGIN INSTALLED BUT OUTDATED --> UPDATE
		if ! [ "$version" == "versionAvail" ] || [ "$AUTOUPDATE" == "1" ]; then
			/usr/bin/curl -s -X POST "http://localhost:8080/scm/api/rest/plugins/update/$groupId:$i:$version" -u "$ADMUSR":"$ADMPW"
			echo "====================== updated $i ========================"
		fi
	fi
done
if ! [ -d "/var/lib/scm/config" ];  then
	mkdir -p "/var/lib/scm/config"
fi

# configure scm-cas-plugin
render_template "/opt/scm-server/conf/cas_plugin.xml.tpl" > "/var/lib/scm/config/cas_plugin.xml"

# configure admin group using api rest calls and json
configState=$(/usr/bin/curl -s "http://127.0.0.1:8080/scm/api/rest/config.json" -u "$ADMUSR":"$ADMPW")
## add group in case it is missing e.g. "admin-groups": "universalAdmin"
adminGroups=`echo "$configState" | jq -r '.["admin-groups"]'`
if [ "$adminGroups" == "null" ]; then
	newConfigState=$(echo "$configState" | jq ".+= {\"admin-groups\": \"$ADMINGROUP\"}" | jq ".+= {\"base-url\": \"http://$FQDN/scm\"}")
	curl -s -H "Content-Type: application/json" -X POST -d "$newConfigState" "http://127.0.0.1:8080/scm/api/rest/config.json" -u "$ADMUSR":"$ADMPW"
fi

# configure scm-mail-plugin
render_template "/opt/scm-server/conf/mail.xml.tpl" > "/var/lib/scm/config/mail.xml"

# Plugin installation end
kill $!

# Final startup
exec /opt/scm-server/bin/scm-server
