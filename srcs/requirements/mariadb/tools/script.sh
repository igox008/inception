#!/bin/bash

# sed -i "s|# port = 3306|port = 3306|1" /etc/mysql/mariadb.cnf
# sed -i "s/127.0.0.1/0.0.0.0/1" /etc/mysql/mariadb.conf.d/50-server.cnf


service mariadb start

sleep 5

	mysqladmin -u root password "${MYSQLROOTPASSWORD}"
	mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQLDB}\`;"
	mysql -e "CREATE USER IF NOT EXISTS \`${MSQLUSER}\`@'%' IDENTIFIED BY '${MYSQLPASSWORD}';"
	mysql -e "GRANT ALL PRIVILEGES ON ${MYSQLDB}.* TO \`${MSQLUSER}\`@'%' IDENTIFIED BY '${MYSQLPASSWORD}' ;"
	mysql -e "FLUSH PRIVILEGES;"
service mariadb stop


exec mysqld_safe 


# while true; do
#     sleep 1
# done