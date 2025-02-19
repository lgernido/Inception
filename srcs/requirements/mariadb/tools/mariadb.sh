#!/bin/bash
mysqld_safe

mysql -uroot -p$SQL_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

mysql -uroot -p$SQL_ROOT_PASSWORD -e  "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

mysql -uroot -p$SQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

mysql -uroot -p$SQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

mysql -uroot -p$SQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

mysql -uroot -p$SQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

mysql -uroot -p$SQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

mysqladmin -uroot -p$SQL_ROOT_PASSWORD shutdown

exec mysqld_safe