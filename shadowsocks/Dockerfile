FROM python:2.7
MAINTAINER Ciel <me@ciel.im>

RUN pip install shadowsocks

EXPOSE 8388

COPY run.sh /run.sh
CMD ["bash", "/run.sh"]
