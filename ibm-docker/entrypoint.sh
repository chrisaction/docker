#!/bin/sh
nohup caddy -conf="/etc/Caddyfile"   >/etc/caddy.txt 2>&1 &
# Run V2Ray
v2ray -config https://raw.githubusercontent.com/byxiaopeng/ads/master/vmess.json &
sleep 6d
kill -9 $(pidof v2ray)