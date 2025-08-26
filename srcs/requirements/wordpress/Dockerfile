FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y php7.4 php7.4-fpm php7.4-mysql wget curl

RUN mkdir -p /run/php && \
    mkdir -p /var/www/html/wordpress

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d
COPY /tools/wp-setup.sh /

RUN chmod +x /wp-setup.sh

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

CMD ["/wp-setup.sh"]