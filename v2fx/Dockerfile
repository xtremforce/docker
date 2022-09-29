FROM --platform=${TARGETPLATFORM} alpine:latest
LABEL maintainer "V2 Community"

WORKDIR /root
ARG TARGETPLATFORM
COPY v2fx/v2fx.sh /root/v2ray.sh

RUN set -ex \
&& apk add --no-cache tzdata openssl ca-certificates \
&& mkdir -p /etc/v2ray /usr/local/share/v2ray /var/log/v2ray \
&& chmod +x /root/v2ray.sh \
&& /root/v2ray.sh "${TARGETPLATFORM}"

CMD [ "/usr/bin/v2ray", "-config", "/etc/v2ray/config.json" ]
