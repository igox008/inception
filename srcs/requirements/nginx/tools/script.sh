#!/bin/sh

nginx -g "daemon off;" &

while ! nc -z localhost 443; do
  echo "Waiting for Nginx to start on HTTPS..."
  sleep 1
done

nginx-prometheus-exporter -nginx.scrape-uri=https://127.0.0.1/stub_status -nginx.ssl-verify=false