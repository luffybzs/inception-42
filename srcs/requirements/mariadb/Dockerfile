FROM debian:bookworm-slim


RUN apt update \
&& apt upgrade -y \
&& apt install -y mariadb-server mariadb-client

COPY ./tools/entrypoint.sh /

RUN chmod +x /entrypoint.sh \
&& chown mysql:mysql /entrypoint.sh

EXPOSE 3306

ENTRYPOINT [ "bash", "/entrypoint.sh" ]