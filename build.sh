#!/bin/sh

set -e
if [ ! -f config.sh ]
then
    echo 'Copy config.sh.sample to config.sh and edit it according to your requirements.'
    exit 1
fi

for i in *.svg
do
    bn=$(basename "$i" .svg)
    rm -rf "$bn"
    mkdir -p "$bn"
    cp "$i" "$bn"
    (source config.sh && cd "$bn" && script fromsvg.log ../ficon.sh "$i" )
    (source config.sh && cd "$bn" && script fromico.log ../cv.sh "$bn.ico" )
done
