FROM alpine:edge
MAINTAINER XForce <hello@web.com>

RUN apk --update add \
	bash aria2

VOLUME /download
VOLUME /conf
EXPOSE 6800

COPY run.sh /run.sh
CMD ["bash", "/run.sh"]
