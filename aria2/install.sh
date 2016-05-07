#!/bin/sh

echo "--> downloading aria2-1.22.0.tar.gz"
wget https://github.com/aria2/aria2/releases/download/release-1.22.0/aria2-1.22.0.tar.gz \
	-O /tmp/aria2-1.22.0.tar.gz
tar zxvf /tmp/aria2-1.22.0.tar.gz -C /tmp
echo "--> compiling and installing aria2"
(cd /tmp/aria2-1.22.0 && ./configure && make && make install)
echo "--> done"
