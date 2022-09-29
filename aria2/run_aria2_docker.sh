#!/bin/sh

if [[ ! -f "/conf/aria2.session" ]]; then
	touch /conf/aria2.session
fi

if [[ ! -f "/conf/aria2.log" ]]; then
	touch /conf/aria2.log
fi

#THIS IS DOCKER VERSION
umask 0000
aria2c --conf-path=/conf/aria2.conf