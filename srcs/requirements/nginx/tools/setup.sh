#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/nginx/ssl/private/selfsigned.key \
-out /etc/nginx/ssl/certs/selfsigned.crt \
-subj "/C=NL/ST=Holland/L=Amsterdam/O=Codam/CN=${DOMAIN_NAME}"

exec nginx -g "daemon off;"