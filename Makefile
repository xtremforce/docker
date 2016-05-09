.PHONY: all aria2 awscli htop shadowsocks zsh

all: aria2 awscli htop shadowsocks zsh

aria2:
	cd aria2 && make

awscli:
	cd awscli && make

htop:
	cd htop && make

shadowsocks:
	cd shadowsocks && make

zsh:
	cd zsh && make
