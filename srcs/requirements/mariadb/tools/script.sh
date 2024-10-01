#!/bin/bash


service mariadb start

sleep 5

	mysqladmin -u root password "${DB_ROOT_PASSWORD}"
	mysql -e "CREATE DATABASE IF NOT EXISTS \`${DATABASE_NAME}\`;"
	mysql -e "CREATE USER IF NOT EXISTS \`${WP_ADMIN_USER}\`@'%' IDENTIFIED BY '${WP_ADMIN_PASSWORD}';"
	mysql -e "GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO \`${WP_ADMIN_USER}\`@'%' IDENTIFIED BY '${WP_ADMIN_PASSWORD}' ;"
	mysql -e "FLUSH PRIVILEGES;"
service mariadb stop


exec mysqld_safe 


# while true; do
#     sleep 1
# done