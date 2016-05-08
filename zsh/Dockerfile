FROM alpine
MAINTAINER Ciel <me@ciel.im>

RUN apk --update add \
	curl wget perl python git bash zsh vim
RUN curl -sSL dot.ciel.im | bash

ENTRYPOINT ["zsh"]
