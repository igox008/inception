FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y curl wget gnupg2 && \
    apt-get clean

RUN wget https://github.com/google/cadvisor/releases/download/v0.49.1/cadvisor-v0.49.1-linux-amd64 -O /usr/bin/cadvisor && \
    chmod +x /usr/bin/cadvisor

EXPOSE 8081

CMD ["/usr/bin/cadvisor", "-logtostderr", "-port", "8081"]
