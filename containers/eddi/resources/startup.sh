#!/bin/bash

MONGO_HOST="mongodb"
EDDI_DB="eddi"
EDDI_ENV="production"

mongoimport -h ${MONGO_HOST} --db ${EDDI_DB} --collection descriptors --file /apiserver/install/mongodb_init/descriptors.json --jsonArray
mongoimport -h ${MONGO_HOST} --db ${EDDI_DB} --collection extensions --file /apiserver/install/mongodb_init/extensions.json --jsonArray
mongoimport -h ${MONGO_HOST} --db ${EDDI_DB} --collection permissions --file /apiserver/install/mongodb_init/permissions.json --jsonArray

java -classpath '.:lib/*' -DEDDI_ENV=${EDDI_ENV} ai.labs.api.ApiServer
