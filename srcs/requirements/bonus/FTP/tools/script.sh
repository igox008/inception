#!/bin/bash

useradd -m -d "/home/${FTP_USER}" ${FTP_USER}

echo "${FTP_USER}:${FTP_PWD}" | chpasswd

echo ${FTP_USER} | tee -a /etc/vsftpd.userlist

mkdir -p "/home/${FTP_USER}/wordpress"

chown -R "${FTP_USER}:${FTP_USER}" "/home/${FTP_USER}"

exec "$@"