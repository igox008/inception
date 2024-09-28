FROM debian:bullseye

RUN apt update && apt install -y mariadb-server python3

COPY ./tools/script.sh /tmp/

RUN chmod +x /tmp/script.sh

ENTRYPOINT [ "./tmp/script.sh" ]

CMD ["mariadbd"]
# CMD ["./tmp/script.sh"]