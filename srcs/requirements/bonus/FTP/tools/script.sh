#!/bin/bash


mkdir -p /var/run/vsftpd/empty
useradd -m -d "/home/${FTP_USER}" "${FTP_USER}" &> /dev/null
mkdir -p /home/${FTP_USER}/wordpress &> /dev/null
chown -R ${FTP_USER}:${FTP_USER} /home/${FTP_USER}/wordpress


echo "${FTP_USER}:${FTP_PWD}" | chpasswd


echo "${FTP_USER}" >> /etc/vsftpd.userlist

chmod 755 "/home/${FTP_USER}"
chmod 755 "/home/${FTP_USER}/wordpress"


exec $@