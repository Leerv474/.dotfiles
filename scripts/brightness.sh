#!/bin/sh

if [[ $# -eq 0 ]]; then
    exit
fi

current_brightness=$(brightnessctl | grep -i "%" | awk -F'[()]' '{print $2}' | awk -F'%' '{print $1}')
if [[ "$1" = "+" ]]; then
    increment=5
fi

if [[ "$1" = "-" ]]; then
    increment=-5
fi
new_brightness=$((current_brightness + increment))

brightnessctl s ${new_brightness}%  > /dev/null
