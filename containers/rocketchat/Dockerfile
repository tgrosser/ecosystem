FROM registry.cloudogu.com/official/base:3.4-1
MAINTAINER Sebastian Sdorra <sebastian.sdorra@cloudogu.com>

# mark as webapp for nginx
ENV SERVICE_TAGS webapp

# needs a mongoinstance - defaults to container linking with alias 'db'
ENV MONGO_URL=mongodb://mongodb:27017/rocketchat \
    HOME=/tmp \
    PORT=3000 \
    Accounts_AvatarStorePath=/var/lib/rocketchat/uploads

ENV RC_VERSION 0.42.0
ENV NODE_VERSION 4.6.0
ENV CFLAGS="-D__USE_MISC"
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

RUN mkdir /app \
 && cd /app \
 && addgroup -S -g 1000 rocketchat && adduser -S -h /var/lib/rocketchat -s /bin/false -G rocketchat -u 1000 rocketchat \
 && curl -Lks "https://rocket.chat/releases/${RC_VERSION}/download" -o rocket.chat.tgz \
 && tar zxf rocket.chat.tgz \
 && rm rocket.chat.tgz \
 && npm cache clear

RUN cd /app/bundle/programs/server \
 && npm install -g node-gyp \
 && npm install

# recompile bcrypt
# see http://stackoverflow.com/questions/29340510/bcrypt-is-breaking-my-meteor-application-how-do-i-fix-it/29347616
RUN rm -rf /app/bundle/programs/server/npm/npm-bcrypt/node_modules/bcrypt \
 && cd /app/bundle/programs/server \
 && npm install bcrypt

ADD resources/startup.sh /startup.sh

# USER rocketchat
WORKDIR /var/lib/rocketchat
VOLUME /var/lib/rocketchat

EXPOSE 3000
CMD ["/startup.sh"]
