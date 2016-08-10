FROM registry.cloudogu.com/official/base:3.4-1
MAINTAINER Sebastian Sdorra <sebastian.sdorra@cloudogu.com>

ADD https://raw.githubusercontent.com/mvertes/dosu/0.1.0/dosu /sbin/
ADD resources/startup.sh /startup.sh
RUN chmod +x /sbin/dosu \
	&& echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
	&& apk upgrade --update \
  && apk add --no-cache mongodb@testing

VOLUME /data/db
EXPOSE 27017 28017

ENTRYPOINT [ "/startup.sh" ]
CMD [ "mongod" ]
