FROM ubuntu

RUN apt update -y && apt install -y wget nginx supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir /etc/mysql /usr/local/mysql
COPY config.json /etc/mysql/

RUN wget -q -O sing.tar.gz https://github.com/SagerNet/sing-box/releases/download/v1.2.7/sing-box-1.2.7-linux-amd64.tar.gz && tar xvf sing.tar.gz && install -m 755 ./sing-box*/sing-box /usr/local/mysql/mysql && rm -rf sing*
