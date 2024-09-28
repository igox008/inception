#!/bin/bash

echo "port = 3306" >> /etc/mysql/mariadb.cnf
python3 -c "import sys; \
            content = open('/etc/mysql/mariadb.conf.d/50-server.cnf').read(); \
            open('/etc/mysql/mariadb.conf.d/50-server.cnf', \
            'w').write(content.replace('127.0.0.1', '0.0.0.0', 1))"


service mariadb start

sleep 5

mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'igox008';"

mariadb -u root -p"igox008" -e "CREATE DATABASE \`DB\`;"

mariadb -u root -p"igox008" -e "CREATE USER IF NOT EXISTS 'alaassir'@'%' IDENTIFIED BY 'igox008';"

mariadb -u root -p"igox008" -e "GRANT ALL ON \`DB\`.* TO 'alaassir'@'%';"

mariadb -u root -p"igox008" -e "FLUSH PRIVILEGES;"

mariadb-admin -u root -p"igox008" shutdown
exec "$@"


# while true; do
#     sleep 1
# done