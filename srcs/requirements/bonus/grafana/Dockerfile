FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    tar 

RUN wget https://github.com/prometheus/prometheus/releases/download/v2.41.0/prometheus-2.41.0.linux-amd64.tar.gz && \
    tar xvf prometheus-2.41.0.linux-amd64.tar.gz && \
    mv prometheus-2.41.0.linux-amd64 /usr/local/prometheus && \
    rm prometheus-2.41.0.linux-amd64.tar.gz && \
    mkdir -p /etc/prometheus

RUN wget https://dl.grafana.com/oss/release/grafana_9.6.6_amd64.deb && \
    dpkg -i grafana_9.6.6_amd64.deb && \
    rm grafana_9.6.6_amd64.deb

COPY ./conf/prometheus.yml /etc/prometheus/prometheus.yml

EXPOSE 3000 9090

CMD ["/bin/sh", "-c", "/usr/local/prometheus/prometheus --config.file=/etc/prometheus/prometheus.yml & /usr/sbin/grafana-server"]
