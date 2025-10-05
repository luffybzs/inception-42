FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/init.sh /init.sh
RUN chmod +x /init.sh

RUN openssl req -x509 -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/server.key \
    -out /etc/nginx/ssl/server.crt \
    -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=ayarab.42.fr"

EXPOSE 443

WORKDIR /var/www/wordpress

ENTRYPOINT [ "/init.sh" ]
