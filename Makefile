.PHONY: all aria2 awscli shadowsocks zsh

all: aria2 awscli shadowsocks zsh

aria2:
	cd aria2 && make

awscli:
	cd awscli && make

shadowsocks:
	cd shadowsocks && make

zsh:
	cd zsh && make
