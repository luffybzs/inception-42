FROM debian:trixie-slim

RUN apt update \
	&& apt -y upgrade \
	&& apt install -y php php7.4-fpm php-mysqli default-mysql-client mariadb-client

EXPOSE 9000

COPY ./tools/wordpress.sh /

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /var/www/wordpress


ENTRYPOINT [ "bash", "/wordpress.sh" ]

# RUN apt-get update && \
#     apt-get upgrade -y && \
#     apt-get install -y wget php php-curl php-fpm php-bcmath  php-soap  php-mbstring php-mysqlnd php-gd php-xml php-intl php-zip curl mariadb-client  && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*
# RUN 	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
# 	chmod +x wp-cli.phar && \
# 	mv wp-cli.phar /usr/local/bin/wp

# RUN mkdir -p /var/www/wordpress

# COPY wordpress.sh /usr/local/bin/wordpress.sh

# RUN chmod +x /usr/local/bin/wordpress.sh

# EXPOSE 9000

# ENTRYPOINT ["sh", "-c", "cd /var/www/wordpress && /usr/local/bin/wordpress.sh"]

# CMD ["php-fpm", "-F"]
