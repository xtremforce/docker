.PHONY: all awscli shadowsocks

all: aria2 awscli shadowsocks

aria2:
	cd aria2 && make

awscli:
	cd awscli && make

shadowsocks:
	cd shadowsocks && make
