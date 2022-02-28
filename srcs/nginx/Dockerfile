FROM debian:buster
EXPOSE 443

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install nginx
RUN apt-get -y install openssl

RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=France/L=Lyon/O=42/OU=42/CN=jcambaki" -newkey rsa:4096 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;
COPY ./conf/default etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]