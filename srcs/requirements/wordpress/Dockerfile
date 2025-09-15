FROM debian:bookworm


RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y wget php php-cgi php-fpm php-bcmath  php-soap  php-mbstring php-mysqlnd php-gd php-xml php-intl php-zip curl mariadb-client  && \
    apt-get clean

#RUN apt-get update && \
#   apt-get upgrade -y && \
#    apt-get install -y  && \
#   apt-get clean php7.4 wget php php-curl php-fpm php-bcmath  php-soap  php-mbstring php-mysqlnd php-gd php-xml php-intl php-zip curl mariadb-client  

EXPOSE 9000

COPY ./tools/wordpress.sh /

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /var/www/wordpress


ENTRYPOINT [ "bash", "/wordpress.sh" ]


 

# RUN mkdir -p /var/www/wordpress

# COPY wordpress.sh /usr/local/bin/wordpress.sh

# RUN chmod +x /usr/local/bin/wordpress.sh

# EXPOSE 9000

# ENTRYPOINT ["sh", "-c", "cd /var/www/wordpress && /usr/local/bin/wordpress.sh"]

# CMD ["php-fpm", "-F"]
