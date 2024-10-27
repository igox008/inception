#!/bin/bash

cat /etc/redis/redis.conf | grep -v "bind 127.0.0.1" > /etc/redis/redis.new
cat /etc/redis/redis.new | grep -v "maxmemory <bytes>" > /etc/redis/redis.new
cat /etc/redis/redis.new | grep -v "# maxmemory-policy noeviction" > /etc/redis/redis.new
echo "#bind 127.0.0.1" >> /etc/redis/redis.new
echo "maxmemory 100mb" >> /etc/redis/redis.new
echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.new
cat /etc/redis/redis.new > /etc/redis/redis.conf
rm -f /etc/redis/redis.new

redis-server --protected-mode no