#!/bin/sh

#判断 Env 中是否存在 PGID 和 PUID
if [[ -z "${PUID}" ]]; then
	PUID=1026
fi
if [[ -z "${PGID}" ]]; then
	PGID=100
fi
if [[ -z "${UMASK}" ]]; then
	UMASK=022
fi

if [[ ! -f "/conf/aria2.session" ]]; then
	touch /conf/aria2.session
fi

if [[ ! -f "/conf/aria2.log" ]]; then
	touch /conf/aria2.log
fi

# 设置文件权限
chown -R ${PUID}:${PGID} /conf
chown -R ${PUID}:${PGID} /download

# 设置aria2运行用户
if [ ${PUID} -eq "0" ]
then
    USER=root
else
    USER=aria2
    groupmod -o -g "$PGID" "$USER"
    usermod -o -u "$PUID" -g "$PGID" "$USER"
fi

umask ${UMASK}
sudo -u#${PUID} /usr/bin/aria2c --conf-path=/conf/aria2.conf
