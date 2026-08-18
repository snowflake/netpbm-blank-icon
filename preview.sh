#!/bin/sh

# View the Icons in Preview (macOS Only)

for i in *.svg
do
    bn=$(basename "$i" .svg)
    fn="$bn/$bn.ico"
    # This will open a Preview window for each icon.
    # The menu item "Window/Merge all Windows" will make a tabbed window.
    if test -f "$fn"
    then
	open -a Preview "$fn"
    fi
    # oit="$oit $bn/$bn.ico"
done


# 
# Preview sometimes crashes if opening 5 icons in one command.
# It is quite temperamental and does not always show all the sub-icons.


# don't put quotes around $oit
# The next line is disabled for the moment.
# open $oit
