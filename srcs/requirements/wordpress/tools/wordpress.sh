#!/bin/bash

mkdir -p /var/www/html

cd /var/www/html

rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname="DB" --dbuser="alaassir" \
                            --dbpass="igox008" --dbhost="localhost" --allow-root
./wp-cli.phar core install --url="alaassir.42.fr/" --title="allo" --admin_user="alaassir" \
                           --admin_password="igo" --admin_email="alaassir@student.1337.ma" \
                           --skip-email --allow-root
./wp-cli.phar user create "slave" "slave@HasNo.mail" --role=author --user_pass="slave1dollar" --allow-root

exec "$@"