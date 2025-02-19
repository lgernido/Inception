FROM debian:bullseye

RUN apt-get update -y

RUN apt-get upgrade -y 

RUN apt-get install mariadb-server -y

RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 755 /var/run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mariadb.sh /usr/local/bin/mariadb.sh

RUN chmod +x ./usr/local/bin/mariadb.sh

VOLUME ["/var/lib/mysql"]

CMD ["/usr/local/bin/mariadb.sh"]