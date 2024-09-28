#!/bin/bash

service mariadb start

sleep 5

mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'igox008';"

mariadb -u root -p"igox008" -e "CREATE DATABASE \`DB\`;"

mariadb -u root -p"igox008" -e "CREATE USER IF NOT EXISTS 'alaassir'@'%' IDENTIFIED BY 'igox008';"

mariadb -u root -p"igox008" -e "GRANT ALL ON \`DB\`.* TO 'alaassir'@'%';"

mariadb -u root -p"igox008" -e "FLUSH PRIVILEGES;"

service mariadb stop


# while true; do
#     sleep 1
# done