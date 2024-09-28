FROM debian:bullseye

RUN apt update
RUN apt install php php-fpm php-mysql unzip curl wget -y

COPY ./tools/wordpress.sh /tmp/
RUN chmod +x /tmp/wordpress.sh

ENTRYPOINT ["./tmp/wordpress.sh"]

CMD ["php-fpm7.4", "-F"]