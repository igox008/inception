#!/bin/bash

mkdir -p /var/www/html

sed -i "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/" /etc/php/7.4/fpm/pool.d/www.conf
cd /var/www/html
sleep 10
rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

# mv /var/www/wordpress/wp-config-sample.php  /var/www/wordpress/wp-config.php


wp config create --dbname="DB" --dbuser="alaassir" --dbpass="igo" --dbhost="mariadb:3306" --allow-root
wp core install --url="localhost" --title="allo" --admin_user="alaassir" --admin_email="alaassir@student.1337.ma" --skip-email --allow-root
wp user create "slave" "slave@HasNo.mail" --role=author --user_pass="slave1dollar" --allow-root

exec $@