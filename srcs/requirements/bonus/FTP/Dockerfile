FROM debian:bullseye

RUN apt update && \
    apt install -y vsftpd

COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/script.sh /tmp/.


RUN chmod +x /tmp/script.sh

ENTRYPOINT [ "./tmp/script.sh" ]
# RUN useradd -m -d /home/${FTP_USER} -s /bin/bash ${FTP_USER} && \
#     echo "${FTP_USER}:${FTP_PWD}" | chpasswd && mkdir -p /home/${FTP_USER}/wordpress && \
#     chown -R ${FTP_USER}:${FTP_USER} /home/${FTP_USER}

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]