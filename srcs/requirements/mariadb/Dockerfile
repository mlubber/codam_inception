FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server mariadb-client

COPY ./conf/db-config.cnf /
COPY ./tools/db-setup.sh /

RUN chmod +x /db-setup.sh

EXPOSE 3306

CMD ["/db-setup.sh"]