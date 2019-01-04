#!/bin/sh
privoxy --no-daemon /conf/privoxy.conf
#ss-server -c /conf/ss-server.json
ss-local -c /conf/ss-local.json