# Dockerfile for shadowsocks-libev based alpine
# Copyright (C) 2018 Teddysun <i@teddysun.com>
# Reference URL:
# https://github.com/shadowsocks/shadowsocks-libev
# https://github.com/teddysun/shadowsocks_install/tree/master/docker/shadowsocks-libev

FROM alpine:latest
LABEL maintainer="Teddysun <i@teddysun.com>"

ENV LIBEV_VER 3.2.3
ENV LIBEV_NAME shadowsocks-libev-${LIBEV_VER}
ENV LIBEV_RELEASE https://github.com/shadowsocks/shadowsocks-libev/releases/download/v${LIBEV_VER}/${LIBEV_NAME}.tar.gz

RUN \
apk --update --upgrade add \
privoxy

RUN runDeps="\
		tar \
		git \
		wget \
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
	"; \
	set -ex \
	&& apk add --no-cache --virtual .build-deps ${runDeps} \
	&& mkdir -p /tmp/libev \
	&& cd /tmp/libev \
	&& git clone --depth=1 https://github.com/shadowsocks/simple-obfs.git . \
	&& git submodule update --init --recursive \
	&& ./autogen.sh \
	&& ./configure --prefix=/usr --disable-documentation \
	&& make install \
	&& rm -rf * \
	&& wget -qO ${LIBEV_NAME}.tar.gz ${LIBEV_RELEASE} \
	&& tar zxf ${LIBEV_NAME}.tar.gz \
	&& cd ${LIBEV_NAME} \
	&& ./configure --prefix=/usr --disable-documentation \
	&& make install \
	&& apk add --no-cache rng-tools \
		$(scanelf --needed --nobanner /usr/bin/ss-* \
		| awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
		| xargs -r apk info --installed \
		| sort -u) \
	&& apk del .build-deps \
	&& cd /tmp \
	&& rm -rf /tmp/libev

RUN rm /var/cache/apk/*	

VOLUME /conf

# RUN cp /etc/shadowsocks-libev/config.json /conf/ss-server-sample.json
RUN cp /etc/privoxy/config /conf/privoxy-sample.txt

USER nobody



#------------------------------------------------------------------------------
# Expose ports and entrypoint:
#------------------------------------------------------------------------------
EXPOSE 11080/tcp 11080/udp
EXPOSE 8118

CMD ["/conf/run.sh"]
