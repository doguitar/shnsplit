FROM ubuntu:22.04 AS base

ENV INTERVAL="30"

RUN apt-get update && \
    apt-get install -y shntool && \
    apt-get install -y flac && \
    rm -rf /var/lib/apt/lists/*

ADD --chmod=0755 app/*.sh /root/

CMD ["/bin/bash", "/root/init.sh"]