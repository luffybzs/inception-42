#!/bin/bash
#set -eux

exec mysqld_safe &

until mysqladmin ping >/dev/null 2>&1; do
	echo "WAITING FOR MYSQLQADMIN..."
    sleep 1
done

# log into MariaDB as root and create database and the user
mysql  -u root -p$MYSQL_ROOT_PASSWORD -h localhost -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql  -u root -p$MYSQL_ROOT_PASSWORD -h localhost -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql  -u root -p$MYSQL_ROOT_PASSWORD -h localhost -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql  -u root -p$MYSQL_ROOT_PASSWORD -h localhost -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mysql  -u root -p$MYSQL_ROOT_PASSWORD -h localhost -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
echo "MariaDB database and user were created successfully! "
exec mysqld_safe