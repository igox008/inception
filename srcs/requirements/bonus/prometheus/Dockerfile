FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    wget \
    tar

RUN useradd --no-create-home --shell /bin/false prometheus

RUN mkdir -p /etc/prometheus /var/lib/prometheus

RUN chown prometheus:prometheus /etc/prometheus /var/lib/prometheus

RUN wget https://github.com/prometheus/prometheus/releases/download/v2.54.1/prometheus-2.54.1.linux-amd64.tar.gz \
    && tar -xzf prometheus-2.54.1.linux-amd64.tar.gz \
    && mv prometheus-2.54.1.linux-amd64/prometheus /usr/local/bin/ \
    && mv prometheus-2.54.1.linux-amd64/promtool /usr/local/bin/ \
    && mv prometheus-2.54.1.linux-amd64/consoles /etc/prometheus \
    && mv prometheus-2.54.1.linux-amd64/console_libraries /etc/prometheus \
    && rm -rf prometheus-2.54.1.linux-amd64.tar.gz prometheus-2.54.1.linux-amd64

EXPOSE 9090

USER prometheus

WORKDIR /etc/prometheus

COPY ./conf/prometheus.yml .

CMD ["prometheus", \
     "--config.file=/etc/prometheus/prometheus.yml", \
     "--storage.tsdb.path=/var/lib/prometheus/"]
