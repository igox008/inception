FROM debian:bullseye

RUN apt update && apt install -y php7.4

COPY ./conf/index.html /

COPY ./tools/script.sh /

RUN chmod +x script.sh

CMD [ "./script.sh" ]