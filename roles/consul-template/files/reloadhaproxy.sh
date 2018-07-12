#!/bin/sh

[ -n "${DEBUG}" ] && set -x

# first start
if [ ! -f /etc/haproxy/haproxy.cfg.previous ]; then
  echo "$0: First configuration"
  cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.previous
  systemctl restart haproxy
  exit 0
fi

# configuration update occured
CHECK=$(diff -u -p /etc/haproxy/haproxy.cfg.previous /etc/haproxy/haproxy.cfg|wc -l)


echo ${CHECK}

if [ ${CHECK} -gt 0 ]; then
  echo "Restart HAPROXy"
  systemctl restart haproxy
fi

echo "Copy HAPROXY Configure"
rm -f /etc/haproxy/haproxy.cfg.previous
cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.previous