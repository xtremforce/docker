FROM alpine:edge
MAINTAINER XForce <hello@web.com>
USER root
WORKDIR /

RUN	set -x && \
	apk add --no-cache --update wget unzip curl && \
	export VER=`curl --silent "https://api.github.com/repos/liuzhuoling2011/baidupcs-web/releases/latest" |grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'` && \
	wget --no-check-certificate https://github.com/liuzhuoling2011/baidupcs-web/releases/download/$VER/BaiduPCS-Go-$VER-linux-amd64.zip && \
	unzip BaiduPCS-Go-$VER-linux-amd64.zip && \
	mv BaiduPCS-Go-$VER-linux-amd64 BaiduPCS && \
	mkdir -p /opt/BaiduPCS && \
	cp -f BaiduPCS/* /opt/BaiduPCS/ && \
	rm -rf BaiduPCS* && \
	apk del wget unzip

VOLUME ["/download"]
VOLUME ["/root/.config/BaiduPCS-Go"]
CMD ["/opt/BaiduPCS/BaiduPCS-Go"]

EXPOSE 5299
