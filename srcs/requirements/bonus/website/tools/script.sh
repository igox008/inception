#!/bin/bash

mkdir -p /var/run/php

mkdir -p /var/www/html/intro
cd /var/www/html/intro
cp /index.html .

php -S 0.0.0.0:8000 -t /var/www/html/intro/