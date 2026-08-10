#!/bin/sh

# convert ico to various formats
set -e

if [  "$2" != "syspath" ]
then    
    PATH=/opt/netpbm-a/bin:${PATH}
fi

if [ ! "$1"   ]
then
    echo Need an icon filename
    exit 1
fi
echo "************ Converting $1 to various formats ************"
echo "------------ netpbm version info"
which winicontopam
winicontopam -version
echo "------------ split the ico file"
rm -f im*.pam im*.png im*.ico
winicontopam -allimages -v "${1}" | pamsplit - im%d.pam
echo
echo "------------ convert the split files into png"
for i in im*.pam
do
    bn=$(basename "$i" .pam )
    echo "pam to png for $bn"
    pamtopng -v "$i" > "$bn.png"
done
echo ------------ Convert pam to ico
cat im*.pam | pamtowinicon -v > im.ico
echo ------------ Convert each pam to ico
for i in im[0-9]*.pam
do
    xn=$(basename "$i" .pam)
    cat "$i" | pamtowinicon -v > "$xn.ico"
done
