#!/bin/sh

#echo "--> generating token"
#tk=$(date +%s | sha256sum | base64 | head -c 16 ; echo)
#: ${TOKEN:=$tk}
#echo "--> token: $TOKEN"
#echo "--> port: 6800"
#echo "--> data: /download"
#echo "--> cmd: aria2c --dir=/data --rpc-secret=$TOKEN --enable-rpc --rpc-listen-all --rpc-allow-origin-all"
#echo
#aria2c --dir=/data --rpc-secret=$TOKEN --enable-rpc --rpc-listen-all=true --rpc-allow-origin-all
/usr/bin/aria2c --conf-path=/conf/aria2.conf
