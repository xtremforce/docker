#!/bin/sh

echo "--> generating password"
pd=$(date +%s | sha256sum | base64 | head -c 16 ; echo)
: ${PASSWORD:=$pd}
echo "--> password: $PASSWORD"
: ${METHOD:="aes-256-cfb"}
echo "--> method: $METHOD"
echo "--> cmd: ssserver -m $METHOD -k $PASSWORD"
echo
ssserver -m $METHOD -k $PASSWORD
