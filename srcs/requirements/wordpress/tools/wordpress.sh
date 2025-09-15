#!/bin/sh

# until mysql -h "mariadb" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SHOW DATABASES;" > /dev/null 2>&1; do
# 	echo "Database is not ready. Retrying in 5 seconds..."
# 	sleep 5
# done

wait_for_db() {
    echo "Waiting for database connection for $MYSQL_USER@$MYSQL_PASSWORD"
    until mysql -h "mariadb" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SHOW DATABASES;" > /dev/null 2>&1; do
        echo "Database is not ready. Retrying in 5 seconds..."
        sleep 5
    done
    echo "Database is ready!"
}

sleep 10
wait_for_db

wp core download --locale=fr_FR

wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$WP_MYSQL_HOST

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email

wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=$WP_USER_ROLE


exec php-fpm7.4 --nodaemonize --allow-to-run-as-root
