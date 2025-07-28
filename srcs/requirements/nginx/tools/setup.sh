#!/bin/bash

# Generate self-signed SSL certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/nginx/ssl/private/selfsigned.key \
-out /etc/nginx/ssl/certs/selfsigned.crt \
-subj "/C=NL/ST=Holland/L=Amsterdam/O=Codam/CN=${DOMAIN_NAME}"

# Start Nginx in the foreground
echo "Starting Nginx..."
exec nginx -g "daemon off;"