#!/bin/bash

mkdir -p /var/run/php
cd /var/www/html
git clone https://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@github.com/incepigo/adminer.git
while [ ! -d "/var/www/html/adminer" ]; do
    git clone https://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@github.com/incepigo/adminer.git
done
sed -i 's/^listen = .*/listen = 8080/' /etc/php/7.4/fpm/pool.d/www.conf

/usr/sbin/php-fpm7.4 -F