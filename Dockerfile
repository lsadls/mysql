FROM alpine:latest

RUN mkdir /etc/mysql /usr/local/mysql && wget -q -O sing.tar.gz https://github.com/SagerNet/sing-box/releases/download/v1.8.0/sing-box-1.8.0-linux-amd64v3.tar.gz && tar xf sing.tar.gz && install -m 755 sing-box*/sing-box /usr/local/mysql/mysql && rm -rf ./sing-box*
ADD config.json /etc/mysql/config.json

ENTRYPOINT /usr/local/mysql/mysql run -c /etc/mysql/config.json
