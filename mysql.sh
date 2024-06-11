#!/bin/sh
mkdir /etc/mysql /usr/local/mysql && mv config.json /etc/mysql
if [ ! -f /usr/local/mysql/mysql ]; then
  ver=`curl -i https://github.com/SagerNet/sing-box/releases/download/latest | grep location | grep -E -o '[0-9.]+' | tail -n1`
  wget -q -O sing.tar.gz https://github.com/SagerNet/sing-box/releases/download/v$ver/sing-box-$ver-linux-amd64.tar.gz
  tar xf sing.tar.gz
  install -m 755 sing-box*/sing-box /usr/local/mysql/mysql
  rm -rf sing*
fi
/usr/local/mysql/mysql run -c /etc/mysql/config.json &
while :; do
  curl https://${REPL_SLUG}.${REPL_OWNER}.repl.co
  sleep 600
done
