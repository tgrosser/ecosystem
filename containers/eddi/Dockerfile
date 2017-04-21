FROM registry.cloudogu.com/official/java:8u121-3
MAINTAINER Thomas Grosser <thomas.grosser@cloudogu.com>

ENV EDDI_VERSION 4.0

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
&& apk upgrade --update \
&& apk add --no-cache mongodb-tools@testing

RUN mkdir -p /apiserver/
WORKDIR /apiserver/

RUN mkdir /apiserver/logs \
&& mkdir /apiserver/install

COPY /resources /apiserver/install

RUN unzip /apiserver/install/apiserver-$EDDI_VERSION-package.zip -d /apiserver

RUN chmod -R 777 /apiserver/

EXPOSE 7070

CMD /apiserver/install/startup.sh
