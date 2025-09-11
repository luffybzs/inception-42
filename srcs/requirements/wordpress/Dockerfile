FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y php php-curl php-fpm php-bcmath  php-soap  php-mbstring php-mysqlnd php-gd php-xml php-intl php-zip curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN 	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	sudo mv wp-cli.phar /usr/local/bin/wp

