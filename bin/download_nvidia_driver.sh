#!/bin/bash

#URL_BASE="ftp://download.nvidia.com/XFree86/Linux-x86_64"
LATEST_URL="ftp://download.nvidia.com/XFree86/Linux-x86_64/latest.txt"
URL_BASE="http://jp.download.nvidia.com/XFree86/Linux-x86_64"


if command -v curl 1>/dev/null; then
    echo "---> using curl" >&2
    function dl_print() {
        curl "$1"
    }
    function dl() {
        curl -o "$2" "$1"
    }
elif command -v wget 1>/dev/null; then
    echo "---> using wget" >&2
    function dl_print() {
        wget -O /dev/stdout "$1"
    }
    function dl() {
        wget -O $2 $1
    }
fi

echo "---> Checking the latest version..." >&2
PATH_LATEST="$(dl_print ${LATEST_URL} | cut -d " " -f 2)"
OUT_FN="$(basename $PATH_LATEST)"

INSTALLER_URL="${URL_BASE}/${PATH_LATEST}"
echo "---> Downloading $INSTALLER_URL" >&2

dl "$INSTALLER_URL" "$OUT_FN"
chmod +x "$OUT_FN"

echo "---> Finished! " >&2
