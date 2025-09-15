#!/bin/sh

until mysql -h "mariadb" -u "$MARIADB_USER" -p"$MARIADB_USER_PASSWORD" -e "SHOW DATABASES;" > /dev/null 2>&1; do
	echo "Database is not ready. Retrying in 5 seconds..."
	sleep 5
done


wp core download --locale=fr_FR

wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email

wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=$WP_USER_ROLE


