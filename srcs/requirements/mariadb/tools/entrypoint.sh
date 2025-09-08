#!/bin/sh

if [ ! -d "/mnt/vol/mariadb/wordpress" ];
then
	mkdir -p /init
	mkdir -p /mnt/vol/mariadb
	chown -R mysql:mysql /mnt/vol/mariadb
	echo "
		FLUSH PRIVILEGES;
		CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
		CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
		GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
		FLUSH PRIVILEGES;
	" > /init/init.sql
	mariadb-install-db --user=mysql --datadir="/mnt/vol/mariadb" --extra-file="/init/init.sql"
fi

exec "$@"
