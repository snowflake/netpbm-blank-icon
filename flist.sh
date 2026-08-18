#!/bin/sh

# Generate a listing of all the ICOs.

for i in *.svg
do
    bn=$(basename "$i" .svg)
    ls -l "$bn/$bn.ico"
done
