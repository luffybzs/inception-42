#!/bin/bash

# Start MariaDB in the background
exec mysqld_safe &

# Wait for MariaDB to be ready
until mysqladmin ping >/dev/null 2>&1; do
    echo "Waiting for MariaDB..."
    sleep 1
done

# Create database and user
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -h localhost -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -h localhost -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -h localhost -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '$MYSQL_USER'@'%';"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -h localhost -e "FLUSH PRIVILEGES;"

# Shutdown initial instance
mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

# Start MariaDB in foreground
exec mysqld_safe