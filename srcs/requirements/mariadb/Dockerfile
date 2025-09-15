FROM debian:bookworm


RUN apt update \
&& apt upgrade -y \
&& apt install -y mariadb-server mariadb-client

RUN mkdir -p /run/mysqld /var/run/mysqld /var/lib/mysql /var/log/mysql \
&& chown -R mysql:mysql /run/mysqld /var/run/mysqld /var/lib/mysql /var/log/mysql \
&& chmod -R 750 /run/mysqld /var/run/mysqld /var/log/mysql /var/lib/mysql

COPY ./tools/entrypoint.sh /
COPY ./conf/mariadb.cnf /etc/mysql/mariadb.cnf

RUN chmod +x /entrypoint.sh \
&& chown mysql:mysql /entrypoint.sh \
&& chown mysql:mysql /etc/mysql/mariadb.cnf

EXPOSE 3306

ENTRYPOINT [ "bash", "/entrypoint.sh" ]