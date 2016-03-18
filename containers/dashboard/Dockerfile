# should be changed to nodejs basebox asap
FROM registry.cloudogu.com/official/base:3.3-1
MAINTAINER christoph wolfes <christoph.wolfes@triology.de>

#could be deleted if inherited from nodejs basebox
#install newest nodejs version
RUN apk add --update nodejs

# startscript
ADD ./startup.sh /startup.sh
RUN chmod +x /startup.sh

# tags and ports
ENV SERVICE_TAGS webapp
EXPOSE 3000

# science ¯\_(ツ)_/¯
CMD ["/bin/bash", "/startup.sh"]

