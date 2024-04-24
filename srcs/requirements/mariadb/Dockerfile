FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install mariadb-server -y

RUN mkdir -p /run/mysqld \
&& chown -R mysql:mysql /run/mysqld \
&& chmod 777 /run/mysqld

EXPOSE 3306

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/db.sh /tools/db.sh

RUN chmod +x ./tools/db.sh

ENTRYPOINT ["sh", "tools/db.sh"]

CMD ["mysqld", "--user=mysql"]
