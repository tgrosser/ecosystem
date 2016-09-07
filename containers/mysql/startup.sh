#!/bin/bash
mkdir -p /var/run/mysqld
chown -R mysql: /var/run/mysqld

# installation
#if [ ! -f /var/lib/mysql/ibdata1 ]; then
if [ ! -d /usr/local/mysql ]; then
    # set stage for health check
    doguctl state installing

    echo "Starting steps originally done in Dockerfile..."
    mv /usr/local/mysql-5.7.14-linux-glibc2.5-x86_64 /usr/local/mysql
    #RUN cd /usr/local/mysql
    mkdir /usr/local/mysql/mysql-files
    chmod 750 /usr/local/mysql/mysql-files
    chown -R mysql /usr/local/mysql
    chgrp -R mysql /usr/local/mysql

    apk add --update libstdc++ libgcc
    ldd --version

    # last part from http://dev.mysql.com/doc/refman/5.7/en/binary-installation.html
    echo "Starting installation steps in startup.sh now"
    su -c "/usr/local/mysql/bin/mysqld --initialize --user=mysql" mysql
    # MySQL 5.7.6 and up
    ls -l /usr/local/mysql/bin/
    ldd /usr/local/mysql/bin/mysql_ssl_rsa_setup
    /usr/local/mysql/bin/mysql_ssl_rsa_setup
    chown -R root /usr/local/mysql
    chown -R mysql /usr/local/mysql/data /usr/local/mysql/mysql-files
    /usr/local/mysql/bin/mysqld_safe --user=mysql &

    # bind server to 0.0.0.0
    echo "sed command now"
    sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf



    # install database
    mysql_install_db --user=mysql --datadir="/var/lib/mysql"

    # start daemon in background
    /usr/bin/mysqld_safe --user=mysql &

    # create random root password
    MYSQL_ROOT_PASSWORD=$(doguctl random)

    # store the password encrypted
    doguctl config -e password "${MYSQL_ROOT_PASSWORD}"

    # wait until mysql is ready to accept connections
    doguctl wait --port 3306

    # set generated root password
    mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO root@'%' IDENTIFIED BY \"${MYSQL_ROOT_PASSWORD}\" WITH GRANT OPTION;"

    # secure the installation
    # http://www.jbmurphy.com/2011/06/20/mysql_secure_installation/
    mysql -uroot -e "DROP DATABASE test;"
    mysql -uroot -e "DELETE FROM mysql.user WHERE User=\";\""
    mysql -uroot -e "FLUSH PRIVILEGES;"

    # set stage for health check
    doguctl state ready
echo "ready now"
    # reattach daemon
    wait
else
  # set stage for health check
  doguctl state ready
echo "ready now"
  # start mysql
  exec /usr/bin/mysqld_safe --user=mysql
fi
