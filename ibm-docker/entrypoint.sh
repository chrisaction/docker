#!/bin/sh
nohup caddy -conf="/etc/Caddyfile"   >/etc/caddy.txt 2>&1 &
# Run V2Ray
v2ray -config https://raw.githubusercontent.com/chrisaction/doce/master/vmess.json
