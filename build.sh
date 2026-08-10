#!/bin/sh

for i in *.svg
do
    bn=$(basename "$i" .svg)
    rm -rf "$bn"
    mkdir -p "$bn"
    cp "$i" "$bn"
    (cd "$bn" && script fromsvg.log ../ficon.sh "$i" )
    (cd "$bn" && script fromico.log ../cv.sh "$bn.ico" )
done
