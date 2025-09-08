FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d

RUN mkdir -p /run/mysqld

RUN touch /run/mysqld/mysql.sock

RUN chown -R mysql:mysql /run/mysqld

COPY tools/entrypoint.sh /docker-entrypoint-initdb.d/

RUN chmod +x /docker-entrypoint-initdb.d/entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/docker-entrypoint-initdb.d/entrypoint.sh"]
CMD ["mariadbd-safe", "--datadir=/mnt/vol/mariadb", "--bind-address=0.0.0.0"]
