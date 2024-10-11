#!/bin/bash

mkdir -p /var/run/php

while [ ! -d "/var/www/html/website" ]; do
    mkdir -p /var/www/html/website
done

cd /var/www/html/website
cp /index.html .

php -d error_reporting=E_ALL -d display_errors=1 -S 0.0.0.0:8000 -t /var/www/html/website/