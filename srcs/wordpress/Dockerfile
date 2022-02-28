FROM debian:buster

# Set up port forwarding
EXPOSE 9000

# Install base components
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install php7.3 php-mysqli php-fpm mariadb-client
RUN apt-get -y install wget curl

# Set up FPM config
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
RUN mkdir /run/php/

# Install wordpress CLI tool
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Create wordpress working directory
RUN mkdir -p /var/www/wordpress
WORKDIR /var/www/wordpress

COPY ./conf/tool.sh ./
RUN chmod +x tool.sh

CMD ["./tool.sh"]
