FROM debian:bullseye

RUN apt update && apt install redis-server -y

COPY ./tools/script.sh /
RUN chmod +x script.sh

ENTRYPOINT [ "./script.sh" ]