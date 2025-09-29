FROM debian:bookworm


RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y wget php php-cgi php-fpm php-bcmath  php-soap  php-mbstring php-mysqlnd php-gd php-xml php-intl php-zip curl mariadb-client  && \
    apt-get clean

EXPOSE 9000

COPY ./tools/wordpress.sh /

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /var/www/wordpress


ENTRYPOINT [ "bash", "/wordpress.sh" ]

