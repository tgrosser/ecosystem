#!/bin/bash

docker rm -f py_sphinx
docker create \
  --name py_sphinx  \
  -h py_sphinx  \
  --log-driver="syslog" \
  --log-opt='syslog-tag=py_sphinx ' \
 --net=cesnet1 \
  cesi/py_sphinx 
