#!/bin/bash
#
# if there was an error during execution, a non zero exit value will be returned.
# stderr may be used for diagnostics.
#
# the error code may be 127, if a command could not be found, or 126 if a command could not be executed.
# otherwise a non-zero exit status from the tool may be returned.
#

# in order to provide useful diagnostic messages to stderr, we also use set -x here.
#
set -o errexit
set -o pipefail
set -o nounset

# TODO there is no simple way to propagate errors back to cesapp. at least logging all errors is better than doing nothing.
#
exec 2> >(logger -t create-service-account)

echo "creating service account" >&2

set -x

# parse command line
#

SERVICE="";
TYPE="";
case "$#" in
    1)
        SERVICE="${1}"
        ;;
    2)
        SERVICE="${1}"
        TYPE="${2}"
        ;;
    *)
        echo "usage: create-sa.sh <service> [<type>]"; >&2
        exit 1;
        ;;
esac;

# assemble replacements for template rendering
#

OU="Bind Users"
if [ X"${TYPE}" = X"rw" ]; then
    OU="Special Users"
fi

LDAP_DOMAIN=$(doguctl config --global domain)

# TODO proposal: use doguctl config openldap_suffix in future
OPENLDAP_SUFFIX="dc=cloudogu,dc=com"

# TODO service accounts are rare, collisions are unlikely.
USERNAME="${SERVICE}_$(doguctl random -l 6)"
PASSWORD=$(doguctl random)
ENC_PASSWORD=$(slappasswd -s ${PASSWORD})

# render template
#

# TODO eval/echo/cat destroys double-quotes, dollar signs must be escaped, whole template must be checked for shell escapes.
eval "echo \"$(cat /srv/openldap/new-user.ldif.tpl)\"" > /srv/openldap/new-user_${USERNAME}.ldif


# add service account user to ldap
#

# stdout is not captured, so assign it to /dev/null, leaving stderr for diagnostics
ldapadd -f "/srv/openldap/new-user_${USERNAME}.ldif" >/dev/null

# print details and exit
#
echo "username: cn=${USERNAME},ou=${OU},o=${LDAP_DOMAIN},${OPENLDAP_SUFFIX}"
echo "password: ${PASSWORD}"

exit 0;
