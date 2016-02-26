#!/bin/bash
source /etc/ces/functions.sh
DOMAIN=$(get_config domain)
tries=0
while ! [ $(curl -s -L -w "%{http_code}" "http://localhost:9000/sonar/" -u "admin":"admin" -o /dev/null) -eq 200 ]
do
        ((tries++))
        echo "------------------- INFO  wait for sonar"
        sleep 1
        if [ $tries -gt 200 ]
                then
                        echo "------------------- ERROR  wait for sonar timed out"
                        echo "------------------- INFO  exiting now"
                        kill $!
                        exit 1
        fi
done

curl 'http://127.0.0.1:9000/sonar/email_configuration/save' -H 'content-type: application/x-www-form-urlencoded' --data "smtp_host=postfix&smtp_port=25&smtp_secure_connection=&smtp_username=&smtp_password=&email_from=sonar%40$DOMAIN&email_prefix=%5BSONARQUBE%5D&commit=Save+Email+Settings" -u "admin":"admin"


