# cesi/py_sphinx
FROM cesi/base
MAINTAINER Thomas Grosser <thomas.grosser@triology.de>

## install py_sphinx
RUN apk add --update py_sphinx \
    && rm -rf /tmp/* /var/cache/apk/*

# startscript
ADD ./startup.sh /startup.sh
RUN chmod +x /startup.sh
