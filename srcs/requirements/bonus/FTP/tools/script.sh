#!/bin/bash

mkdir -p /var/run/vsftpd/empty
useradd -m -d "/home/${FTP_USER}" "${FTP_USER}" &> /dev/null
mkdir -p /home/${FTP_USER}/wordpress &> /dev/null
chown -R ${FTP_USER}:${FTP_USER} /home/${FTP_USER}/wordpress

echo "${FTP_USER}:${FTP_PWD}" | chpasswd

exec $@