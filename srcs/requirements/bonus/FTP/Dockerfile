FROM debian:bullseye

RUN apt update && \
    apt install -y vsftpd

COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/script.sh /


RUN chmod +x script.sh

RUN touch /etc/vsftpd.userlist

ENTRYPOINT [ "./script.sh" ]

CMD [ "/usr/sbin/vsftpd", "/etc/vsftpd.conf" ]