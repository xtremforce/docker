FROM ubuntu:14.04
MAINTAINER Ciel <me@ciel.im>

RUN apt-get update
RUN apt-get install -y curl git zsh vim wget tmux
RUN curl -sSL dot.ciel.im | bash

ENTRYPOINT ["zsh"]
