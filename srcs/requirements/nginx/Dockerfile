FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install nginx -y
RUN apt-get install openssl -y

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=aaapatou.42.fr/UID=aaapatou"

RUN mkdir -p /var/run/nginx

COPY ./conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
