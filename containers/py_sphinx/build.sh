#!/bin/bash
docker build -t cesi/py_sphinx $(cd "$(dirname "${BASH_SOURCE[0]}")/docker" && pwd)
