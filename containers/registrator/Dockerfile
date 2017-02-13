# registry.cloudogu.com/official/registrator:0.6.0
# dockerfile is based on https://github.com/progrium/registrator
FROM registry.cloudogu.com/official/base:3.3-1
MAINTAINER Sebastian Sdorra <sebastian.sdorra@cloudogu.com>

COPY startup.sh /startup.sh
COPY registrator_0.6.0_patched.tgz /bin
RUN chmod +x /bin/registrator /startup.sh

ENV DOCKER_HOST unix:///var/run/docker.sock
CMD ["/startup.sh"]
