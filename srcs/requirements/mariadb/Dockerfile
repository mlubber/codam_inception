FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server

COPY ./conf/db-config.cnf /etc/mysql/mariadb.conf.d/db-config.cnf
COPY ./tools/db-setup.sh /

RUN chmod +x /db-setup.sh && \
    chmod 644 /etc/mysql/mariadb.conf.d/db-config.cnf && \
    mkdir -p /run/mysqld && \
    mkdir -p /var/log/mysql && \
    mkdir -p /var/lib/mysql
RUN chown -R mysql:mysql /run/mysqld && \
    chown -R mysql:mysql /var/log/mysql && \
    chown -R mysql:mysql /var/lib/mysql

EXPOSE 3306

CMD ["/db-setup.sh"]