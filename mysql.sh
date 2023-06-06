#!/bin/sh
mkdir /etc/mysql /usr/local/mysql && mv config.json /etc/mysql
if [ ! -f /usr/local/mysql/mysql ]; then
  wget -q -O sing.tar.gz https://github.com/SagerNet/sing-box/releases/download/v1.2.7/sing-box-1.2.7-linux-amd64.tar.gz
  tar xvf sing.tar.gz
  install -m 755 sing-box*/sing-box /usr/local/mysql/mysql
  rm -rf sing*
fi
/usr/local/mysql/mysql run -c /etc/mysql/config.json &
while :; do
  curl https://${REPL_SLUG}.${REPL_OWNER}.repl.co
  sleep 600
done
