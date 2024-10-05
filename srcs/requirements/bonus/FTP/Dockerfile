FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y vsftpd

RUN useradd -m -d /home/${FTP_USER} -s /bin/bash ${FTP_USER} && \
    echo "${FTP_USER}:${FTP_PWD}" | chpasswd