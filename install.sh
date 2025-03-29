#!/bin/bash

folders=(
    "dwm-6.4"
    "slstatus"
    "dmenu"
    "st-0.8.5"
)

function make_and_install {
    make

    if [ $(id -u) -e 0 ]; then # if root we don't need to use sudo
        make install
    else
        sudo make install
    fi
}

for dir in */; do
    (
        echo "$dir"
        cd "$dir"
	make_and_install
    )
done
