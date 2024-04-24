#!/bin/sh
if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
	mysql_install_db
	service mariadb start
	sleep 5
	mysql << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
EOF
	mysqladmin -p$MYSQL_ROOT_PASSWORD shutdown
fi

exec "$@"
