#!/bin/sh

# Set ARG
PLATFORM=$1
#TAG=$2
if [ -z "$PLATFORM" ]; then
    ARCH="64"
else
    case "$PLATFORM" in
        linux/386)
            ARCH="32"
            ;;
        linux/amd64)
            ARCH="64"
            ;;
        linux/arm/v6)
            ARCH="arm32-v6"
            ;;
        linux/arm/v7)
            ARCH="arm32-v7a"
            ;;
        linux/arm64|linux/arm64/v8)
            ARCH="arm64-v8a"
            ;;
        *)
            ARCH=""
            ;;
    esac
fi
[ -z "${ARCH}" ] && echo "Error: Not supported OS Architecture" && exit 1

# Download files
V2RAY_FILE="v2ray-linux-${ARCH}.zip"
DGST_FILE="v2ray-linux-${ARCH}.zip.dgst"
echo "Downloading binary file: ${V2RAY_FILE}"
echo "Downloading binary file: ${DGST_FILE}"

# No CURL here
#LatestVer=`curl --silent "https://api.github.com/repos/v2fly/v2ray-core/releases/latest" |grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'`
LatestVer=`wget -qO- "https://api.github.com/repos/v2fly/v2ray-core/releases/latest" |grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'`

# wget -O ${PWD}/v2ray.zip https://github.com/v2fly/v2ray-core/releases/download/${TAG}/${V2RAY_FILE} > /dev/null 2>&1
# wget -O ${PWD}/v2ray.zip.dgst https://github.com/v2fly/v2ray-core/releases/download/${TAG}/${DGST_FILE} > /dev/null 2>&1

wget -O ${PWD}/v2ray.zip https://github.com/v2fly/v2ray-core/releases/download/${LatestVer}/${V2RAY_FILE} > /dev/null 2>&1
wget -O ${PWD}/v2ray.zip.dgst https://github.com/v2fly/v2ray-core/releases/download/${LatestVer}/${DGST_FILE} > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "Error: Failed to download binary file: ${V2RAY_FILE} ${DGST_FILE}" && exit 1
fi
echo "Download binary file: ${V2RAY_FILE} ${DGST_FILE} completed"

# Check SHA512
# LOCAL=$(openssl dgst -sha512 v2ray.zip | sed 's/([^)]*)//g')
# STR=$(cat v2ray.zip.dgst | grep 'SHA512' | head -n1)

# by xforce
SHA_Result=$(openssl dgst -sha512 v2ray.zip | sed -r s'/[^=]+.(.*)/\1/g' | sed 's/ //g')
echo " SHA_Result = ${SHA_Result}"
if grep -q "${SHA_Result}" v2ray.zip.dgst; then
    echo " Check passed" && rm -fv v2ray.zip.dgst
else
    echo " Check have not passed yet " && exit 1
fi

#CheckSHA=$(cat v2ray.zip.dgst | grep ${SHA_Result})
#echo " CheckSHA = $(CheckSHA)"

#if [ "${CheckSHA}" = "" ]; then
#    echo " Check have not passed yet " && exit 1
#else
#    echo " Check passed" && rm -fv v2ray.zip.dgst
#fi

# Prepare
echo "Prepare to use"
unzip v2ray.zip && chmod +x v2ray v2ctl
mv v2ray v2ctl /usr/bin/
mv geosite.dat geoip.dat /usr/local/share/v2ray/
mv config.json /etc/v2ray/config.json

# Clean
rm -rf ${PWD}/*
echo "Done"
