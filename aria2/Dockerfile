FROM ubuntu:14.04
MAINTAINER Ciel <me@ciel.im>

RUN apt-get update
RUN apt-get install -y build-essential wget
COPY install.sh /install.sh
RUN bash /install.sh

VOLUME /data
EXPOSE 6800

COPY run.sh /run.sh
CMD ["bash", "/run.sh"]
