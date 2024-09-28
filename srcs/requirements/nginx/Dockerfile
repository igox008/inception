FROM debian:bullseye

RUN apt update && apt install -y openssl nginx
RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -newkey rsa:4096 \
    -keyout /etc/nginx/ssl/alaassir.key \
    -out /etc/nginx/ssl/alaassir.crt -sha256 -days 365 -nodes \
    -subj "/C=MA/ST=Casablanca/L=Casablanca/O=1337/OU=1337/CN=alaassir.42.fr"

COPY ./tools/config.conf /etc/nginx/sites-available/default

CMD ["nginx" ,"-g" ,"daemon off;"]