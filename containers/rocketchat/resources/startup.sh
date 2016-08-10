#!/bin/bash
FQDN=$(doguctl config --global fqdn)

# root url with folder
# see https://rocket.chat/docs/installation/manual-installation/running-in-a-sub-folder
# using site url without folder produces invalid mails
export Site_Url="https://${FQDN}/rocketchat"
export ROOT_URL="https://${FQDN}/rocketchat"

# ignore cas certificate
# todo add ces instance certificate to truststore
export NODE_TLS_REJECT_UNAUTHORIZED=0

# cas settings
export CAS_enabled='true'
export CAS_base_url="https://${FQDN}/cas"
export CAS_login_url="${CAS_base_url}/login"

# mail settings
export MAIL_URL='smtp://postfix:25'

# start application
cd /app/bundle
exec node main.js
