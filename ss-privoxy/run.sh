#!/bin/sh
privoxy --no-daemon /conf/privoxy.txt
ss-server -c /conf/shadowsocks.json