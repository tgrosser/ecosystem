#!/bin/bash
source /etc/ces/functions.sh

# enable strict mode
#set -euo pipefail
#IFS=$'\n\t'

# variables
ADMUSR="admin"
ADMPW="admin123"
ADMINGROUP=$(get_config admin_group)
DOMAIN=$(get_config domain)

RETRY_LIMIT=100
BASEURL="http://localhost:8081/nexus"

function check_nexus(){
  SC=$(curl -sL -w "%{http_code}" "${BASEURL}" -u "${ADMUSR}":"${ADMPW}" -o /dev/null)
  echo "INFO SC $SC"
  RC=1
  if [ $SC -gt 199 -a $SC -lt 400 ]; then
    RC=0
  fi
  return $RC
}

function get_json(){
  curl -H 'Content-Type: application/json' \
       -H 'Accept: application/json' \
       "${BASEURL}/${1}" \
       -u "$ADMUSR":"$ADMPW"
}

function set_json(){
  curl -H 'Content-Type: application/json' \
       -X "${1}" \
       -d "$3" \
       "${BASEURL}/${2}" \
       -u "$ADMUSR":"$ADMPW"
}

# create truststore
TRUSTSTORE="/var/lib/nexus/truststore.jks"
create_truststore.sh "${TRUSTSTORE}" > /dev/null

# nexus start command
START_NEXUS="java \
  -server -XX:MaxPermSize=192m -Djava.net.preferIPv4Stack=true -Xms256m -Xmx1g \
  -Djavax.net.ssl.trustStore=${TRUSTSTORE} \
	-Djavax.net.ssl.trustStorePassword=changeit \
  -Dnexus-work=/var/lib/nexus -Dnexus-webapp-context-path=/nexus \
  -cp conf/:`(echo lib/*.jar) | sed -e "s/ /:/g"` \
  org.sonatype.nexus.bootstrap.Launcher ./conf/jetty.xml ./conf/jetty-requestlog.xml"

if ! [ -d /var/lib/nexus/plugin-repository/nexus-cas-plugin-${CAS_PLUGIN_VERSION} ]; then

  # add Cas Pluin
  mkdir -p "/var/lib/nexus/plugin-repository/"
  cp -rf /opt/sonatype/nexus/resources/nexus-cas-plugin-${CAS_PLUGIN_VERSION}/ /var/lib/nexus/plugin-repository/

  # start nexus
  $START_NEXUS &

  # wait until start is complete
  RETRIES=0
  while ! check_nexus; do
    ((RETRIES++))
    echo "WARN wait for nexus"
    sleep 1
    if [ $RETRIES -gt $RETRY_LIMIT ]; then
      echo "ERROR nexus didnt start, exit now"
      exit 1
    fi
  done

  # sleep again, to avoid race conditions
  sleep 1

  # adjust mail and security configuration
  configuration=$(get_json "service/local/global_settings/current" | jq ".data.smtpSettings+={\"host\": \"postfix\"}" | jq ".data.smtpSettings+={\"username\": \"\"}" | jq ".data.smtpSettings+={\"password\": \"\"}" | jq ".data.smtpSettings+={\"systemEmailAddress\": \"nexus@$DOMAIN\"}" | jq ".data+={\"securityAnonymousAccessEnabled\": false}" | jq ".data+={\"securityRealms\": [\"CasAuthenticatingRealm\",\"XmlAuthenticatingRealm\",\"XmlAuthorizingRealm\"]}")
  set_json "PUT" "service/local/global_settings/current" "$configuration"

  # adjust group mapping
  set_json "POST" "service/local/roles" "{\"data\":{\"id\":\"${ADMINGROUP}\",\"name\":\"${ADMINGROUP}\",\"description\":\"${ADMINGROUP}\",\"sessionTimeout\":60,\"roles\":[\"nx-admin\"],\"privileges\":[]}}"

  kill $!
fi

FQDN=$(get_fqdn)
echo "render_template"
render_template "/opt/sonatype/nexus/resources/cas-plugin.xml.tpl" > "/var/lib/nexus/conf/cas-plugin.xml"

# start nexus
exec $START_NEXUS
