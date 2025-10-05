#!/bin/bash


exec mysqld_safe &


until mysqladmin ping >/dev/null 2>&1; do
    echo "Waiting for MariaDB..."
    sleep 1
done

mysql -u root -p"$MYSQL_ROOT_PASSWORD" -h localhost -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -h localhost -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -h localhost -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '$MYSQL_USER'@'%';"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -h localhost -e "FLUSH PRIVILEGES;"


mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

exec mysqld_safe