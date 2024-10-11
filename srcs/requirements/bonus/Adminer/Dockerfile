FROM debian:bullseye

RUN apt update &&  apt install -y git php-mysql php7.4-fpm

COPY ./tools/script.sh /
RUN chmod +x script.sh

ENTRYPOINT [ "./script.sh" ]