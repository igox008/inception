#!/bin/bash

mkdir -p /var/run/php
mkdir -p /run/php /var/www/html/adminer

wget "https://www.adminer.org/latest.php" -O /var/www/html/adminer/adminer.php

sed -i 's/^listen = .*/listen = 8080/' /etc/php/7.4/fpm/pool.d/www.conf

/usr/sbin/php-fpm7.4 -F