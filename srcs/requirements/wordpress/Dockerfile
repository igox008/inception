FROM debian:bullseye

RUN apt update
RUN apt install php-fpm php-mysql unzip curl wget -y

COPY ./tools/wordpress.sh /tmp/
RUN chmod +x /tmp/wordpress.sh

CMD ["./tmp/wordpress.sh"]