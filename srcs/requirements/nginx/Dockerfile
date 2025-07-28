FROM debian:bullseye

RUN apt-get update -y && \
	apt-get upgrade -y && \
    apt-get install -y nginx openssl

RUN	mkdir -p /etc/nginx/ssl/private && \
	mkdir -p /etc/nginx/ssl/certs && \
	chmod 700 /etc/nginx/ssl

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./tools/setup.sh /

RUN chmod +x /setup.sh

EXPOSE 443

CMD ["/setup.sh"]
