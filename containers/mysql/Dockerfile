FROM registry.cloudogu.com/official/base:3.3-1

#MAINTAINER	stephan christann	<stephan.christann@christann.net>
MAINTAINER Robert Auer <robert.auer@cloudogu.com>

# Get mysql source tarball
RUN curl -L http://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.15.tar.gz -o /tmp/mysql.tar.gz

# Remove mysql-client to get rid of MariaDB
RUN apk del mysql-client

# INSTALL SOFTWARE
RUN apk add --update boost-dev build-base binutils cmake make gcc && rm -rf /var/cache/apk/*

# Install MySQL
RUN addgroup mysql \
  && adduser -D -G mysql -s /bin/false mysql
#RUN cd /usr/local
RUN tar zxvf /tmp/mysql.tar.gz -C /tmp/
RUN cmake /tmp/mysql-5.7.15/
RUN make /tmp/mysql-5.7.15/
RUN make install /tmp/mysql-5.7.15/
RUN ls -l /usr/local/mysql
#RUN mv /usr/local/mysql-5.7.14-linux-glibc2.5-x86_64 /usr/local/mysql
#RUN cd /usr/local/mysql
#RUN mkdir /usr/local/mysql/mysql-files \
#  && chmod 750 /usr/local/mysql/mysql-files \
#  && chown -R mysql /usr/local/mysql \
#  && chgrp -R mysql /usr/local/mysql
#RUN bin/mysql_install_db --user=mysql    # Before MySQL 5.7.6
# MySQL 5.7.6 and up
#RUN ls -lha /usr/local/mysql/bin
#RUN su -c "/usr/local/mysql/bin/mysqld --initialize --user=mysql" mysql
# MySQL 5.7.6 and up
#RUN /usr/local/mysql/bin/mysql_ssl_rsa_setup
#RUN chown -R root /usr/local/mysql \
#  && chown -R mysql /usr/local/mysql/data /usr/local/mysql/mysql-files
#RUN /usr/local/mysql/bin/mysqld_safe --user=mysql &
  # Next command is optional
#RUN cp support-files/mysql.server /etc/init.d/mysql.server
#RUN ls -lha /etc/mysql



# bind server to 0.0.0.0
#RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Add MySQL RUN
COPY startup.sh /startup.sh
COPY create-sa.sh /create-sa.sh

# VOLUMES
VOLUME "/var/lib/mysql"

# MYSQL PORT
EXPOSE 3306

# FIRE IT UP
CMD ["/bin/bash", "/startup.sh"]
