FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    wget \
    gnupg2 \
    software-properties-common \
    && wget -q -O - https://packages.grafana.com/gpg.key | apt-key add - \
    && echo "deb https://packages.grafana.com/oss/deb stable main" > /etc/apt/sources.list.d/grafana.list \
    && apt-get update && apt-get install -y grafana \
    && rm -rf /var/lib/apt/lists/*

COPY ./provisioning/datasources /etc/grafana/provisioning/datasources

EXPOSE 3000

CMD ["/usr/sbin/grafana-server", "--homepath=/usr/share/grafana"]
