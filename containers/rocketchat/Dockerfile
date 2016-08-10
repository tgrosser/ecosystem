FROM registry.cloudogu.com/official/base:3.4-1
MAINTAINER Sebastian Sdorra <sebastian.sdorra@cloudogu.com>

# mark as webapp for nginx
ENV SERVICE_TAGS webapp

# needs a mongoinstance - defaults to container linking with alias 'db'
ENV MONGO_URL=mongodb://mongodb:27017/rocketchat \
    HOME=/tmp \
    PORT=3000 \
    Accounts_AvatarStorePath=/var/lib/rocketchat/uploads

ENV RC_VERSION 0.36.0
ENV NODE_VERSION 0.10.45
ENV NPM_VERSION 2.14.1
ENV CFLAGS="-D__USE_MISC"
ENV NPM_VERSION=2
ENV RM_DIRS=/usr/include

# https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz
RUN apk add --update curl ca-certificates imagemagick python build-base tar paxctl linux-headers \
 && curl -SLO "https://cnpmjs.org/mirrors/node/v${NODE_VERSION}/node-v${NODE_VERSION}.tar.gz"

RUN tar xfz "node-v${NODE_VERSION}.tar.gz" \
 && cd "/node-v${NODE_VERSION}" \
 && export GYP_DEFINES="linux_use_gold_flags=0" \
 && ./configure --prefix=/usr \
 && NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
 && make -j${NPROC} -C out mksnapshot BUILDTYPE=Release \
 && paxctl -cm out/Release/mksnapshot \
 && make -j${NPROC} \
 && make install \
 && paxctl -cm /usr/bin/node \
 && cd .. \
 && rm -rf /etc/ssl "/node-v${NODE_VERSION}" \
    /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp \
    /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html

RUN npm install -g npm@"$NPM_VERSION"
RUN mkdir /app \
 && cd /app \
 && addgroup -S -g 1000 rocketchat && adduser -S -h /var/lib/rocketchat -s /bin/false -G rocketchat -u 1000 rocketchat \
 && curl --insecure -fSL "https://rocket.chat/releases/${RC_VERSION}/download" -o rocket.chat.tgz \
 && tar zxf rocket.chat.tgz \
 && rm rocket.chat.tgz \
 && npm cache clear

# use version 1.0.13 of node-fibers instead of 1.0.5
# see https://github.com/laverdet/node-fibers/issues/285
COPY resources/npm-shrinkwrap.json /app/bundle/programs/server/npm-shrinkwrap.json
COPY resources/package.json /app/bundle/programs/server/package.json

RUN cd /app/bundle/programs/server \
 && npm install

# add glibc for various npm errors
ENV GLIBC_VERSION 2.23-r3

RUN curl --insecure -Lks https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub \
 && curl --insecure -Lks https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk -o glibc.apk \
 && curl --insecure -Lks https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk -o glibc-bin.apk \
 && apk add glibc.apk glibc-bin.apk

RUN /usr/glibc-compat/sbin/ldconfig /lib /usr/glibc-compat/lib

# recompile bcrypt
# see http://stackoverflow.com/questions/29340510/bcrypt-is-breaking-my-meteor-application-how-do-i-fix-it/29347616
RUN npm install -g node-gyp \
 && rm -rf /app/bundle/programs/server/npm/npm-bcrypt/node_modules/bcrypt \
 && cd /app/bundle/programs/server \
 && npm install bcrypt

ADD resources/startup.sh /startup.sh

# USER rocketchat
WORKDIR /var/lib/rocketchat
VOLUME /var/lib/rocketchat

EXPOSE 3000
CMD ["/startup.sh"]
