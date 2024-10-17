FROM debian:bullseye

RUN apt update && apt install -y openssl nginx wget netcat-openbsd

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -newkey rsa:4096 \
    -keyout /etc/nginx/ssl/alaassir.key \
    -out /etc/nginx/ssl/alaassir.crt -sha256 -days 365 -nodes \
    -subj "/C=MA/ST=Casablanca/L=Casablanca/O=1337/OU=1337/CN=alaassir.42.fr"

COPY ./conf/config.conf /etc/nginx/sites-available/default
COPY ./tools/script.sh /

RUN wget https://github.com/nginxinc/nginx-prometheus-exporter/releases/download/v0.11.0/nginx-prometheus-exporter_0.11.0_linux_amd64.tar.gz \
    && tar zxvf nginx-prometheus-exporter_0.11.0_linux_amd64.tar.gz \
    && mv nginx-prometheus-exporter /usr/local/bin/ \
    && rm nginx-prometheus-exporter_0.11.0_linux_amd64.tar.gz \
    && chmod +x script.sh

EXPOSE 443 9113

CMD ["./script.sh"]