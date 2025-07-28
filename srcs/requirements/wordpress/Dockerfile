FROM debian:bullseye

ENV DOMAIN_NAME=${DOMAIN_NAME}
ENV WP_DATABASE_NAME=${WP_DATABASE_NAME}

ENV WP_ADMIN=${WP_ADMIN}
ENV WP_ADMIN_PASSWORD=${WP_ADMIN_PASSWORD}
ENV WP_ADMIN_EMAIL=${WP_ADMIN_EMAIL}

ENV WP_USER=${WP_USER}
ENV WP_USER_PASSWORD=${WP_USER_PASSWORD}
ENV WP_USER_EMAIL=${WP_USER_EMAIL}

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y php7.4 php7.4-fpm php7.4-mysql wget curl

RUN mkdir -p /run/php

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d
COPY /tools/wp-setup.sh /

RUN chmod +x /wp-setup.sh

EXPOSE 9000

CMD ["/wp-setup.sh"]