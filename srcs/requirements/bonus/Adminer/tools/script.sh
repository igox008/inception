#!/bin/bash

mkdir -p /var/run/php
cd /var/www/html
mkdir adminer
cd adminer
wget "http://www.adminer.org/latest.php" -O adminer.php

sed -i 's/^listen = .*/listen = 8080/' /etc/php/7.4/fpm/pool.d/www.conf

/usr/sbin/php-fpm7.4 -F