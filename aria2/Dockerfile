FROM alpine:edge
MAINTAINER XForce <hello@web.com>

RUN apk --update add \
	bash aria2

RUN set -xe \
    && rm -rf /var/cache/apk/* \
    && aria2c https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64 -o /usr/local/bin/gosu \
    && chmod +x /usr/local/bin/gosu \

VOLUME /download
VOLUME /conf
EXPOSE 6800

#COPY run.sh /run.sh
#CMD ["bash", "/run.sh"]
CMD set -xe \
    && chmod -R 777 /download \
    && chmod -R 777 /conf \
    && gosu nobody aria2c --conf-path=/conf/aria2.conf
