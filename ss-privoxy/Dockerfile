# Dockerfile for shadowsocks-libev based alpine
# Copyright (C) 2018 Teddysun <i@teddysun.com>
#UPDATED with V2ray-Plugin!

# Reference URL:
# https://github.com/shadowsocks/shadowsocks-libev
# https://github.com/teddysun/shadowsocks_install/tree/master/docker/shadowsocks-libev

FROM alpine:latest
LABEL maintainer="Teddysun <i@teddysun.com>"

RUN \
apk --update --upgrade add privoxy

RUN runDeps="\
		tar \
		git \
		wget \
		curl \
		build-base \
		c-ares-dev \
		autoconf \
		automake \
		libev-dev \
		libtool \
		libsodium-dev \
		linux-headers \
		mbedtls-dev \
		pcre-dev \
		asciidoc \
		xmlto \
	"; \
	set -ex \
	&& apk add --no-cache --virtual .build-deps ${runDeps} \
	&& mkdir -p /tmp/libev \
	&& cd /tmp/libev \
	&& echo "------------------------" \
	&& echo "Install Shadowsocks" \
	&& echo "------------------------" \
	&& git clone https://github.com/shadowsocks/shadowsocks-libev.git \
	&& cd shadowsocks-libev \
	&& git submodule update --init --recursive \
	&& ./autogen.sh && ./configure && make \
	&& make install \
	&& echo "------------------------" \
	&& echo "Install v2rayplugin" \
	&& echo "------------------------" \
	&& mkdir -p /tmp/v2rayplugin \
	&& cd /tmp/v2rayplugin \
	&& export V2RAY_PLUGIN_VER=`curl --silent "https://api.github.com/repos/shadowsocks/v2ray-plugin/releases/latest" |grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'` \
	&& export V2RAY_PLUGIN_RELEASE=https://github.com/shadowsocks/v2ray-plugin/releases/download/$V2RAY_PLUGIN_VER/v2ray-plugin-linux-amd64-$V2RAY_PLUGIN_VER.tar.gz \
	&& wget -qO v2ray_plugin.tar.gz ${V2RAY_PLUGIN_RELEASE} \
        && tar xf v2ray_plugin.tar.gz \
        && mv v2ray-plugin_linux_amd64 /usr/local/bin/v2ray-plugin \
	&& echo "------------------------" \
	&& echo "Clean" \
	&& echo "------------------------" \
	&& ls /usr/bin/ss-* | xargs -n1 setcap cap_net_bind_service+ep \
 	&& apk del .build-deps \
 	# Runtime dependencies setup
 	&& apk add --no-cache \
	      ca-certificates \
	      rng-tools \
	      $(scanelf --needed --nobanner /usr/bin/ss-* \
	      | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
	      | sort -u) \
	&& cd /tmp \
	&& rm -rf /tmp/v2rayplugin \
	&& rm -rf /tmp/libev

RUN rm /var/cache/apk/*	

VOLUME /conf

# RUN cp /etc/shadowsocks-libev/config.json /conf/ss-server-sample.json
RUN cp /etc/privoxy/config /conf/privoxy-sample.txt

#USER nobody



#------------------------------------------------------------------------------
# Expose ports and entrypoint:
#------------------------------------------------------------------------------
EXPOSE 11080/tcp 11080/udp
EXPOSE 18118

#CMD ["/conf/run.sh"]
ENTRYPOINT ["/conf/run.sh"]
