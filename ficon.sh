#!/bin/sh
set -e

# input svg file and convert it into small png files 16x16 32x32 48X48

if [ "$1" == "" ]
then
    echo need a filename base
    exit 1
fi

if [  "$2" != "syspath" ]
then    
    PATH=/opt/netpbm-a/bin:${PATH}
fi
echo "************* Converting $1 to ico format *****************"
echo "------------- display netpbm version"
which winicontopam
winicontopam -version

m=$(basename "${1}" .svg)

if [ ! -f "${m}.svg" ]
then
    echo "ERROR: ${m}.svg file not found"
    exit 1
fi
rm -f tmp*
t=tmp
for  i in 16 32 48
do
    inkscape --export-type="png" --export-width=$i --export-height=$i \
	     --export-filename="${t}${i}.png" "${m}.svg"
    pngtopam "${t}${i}.png" > "${t}${i}.pam"
    pamtowinicon -pngthreshold=1 "${t}${i}.pam" > "${t}${i}.ico" 
done
cat ${t}[0-9]*.pam > "${t}.comb.pam"
pamtowinicon -pngthreshold=1 "${t}.comb.pam" > "${m}.ico"


