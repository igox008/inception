#!/bin/bash

cat /etc/redis/redis.conf | grep -v "bind 127.0.0.1" > /etc/redis/redis.new
echo "#bind 127.0.0.1" >> /etc/redis/redis.new
cat /etc/redis/redis.new > /etc/redis/redis.conf
rm -f /etc/redis/redis.new

redis-server --protected-mode no