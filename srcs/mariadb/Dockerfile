FROM debian:buster
EXPOSE 3306

ARG DB_DB
ARG DB_USER
ARG DB_PASS

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY conf/db.sql /
RUN sed -i "s/DB_DB/$DB_DB/g" /db.sql
RUN sed -i "s/DB_USER/$DB_USER/g" /db.sql
RUN sed -i "s/DB_PASS/$DB_PASS/g" /db.sql

RUN service mysql start && mysql < db.sql
RUN rm -f db.sql

CMD ["mysqld"]