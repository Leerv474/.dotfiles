#!/bin/sh

# INFO: check internet connection
if [[ $(nmcli | grep "wlp2s0: connected" | wc -c) -eq 0 ]];
then
    echo "%{F#66ffffff}󰌆 "
    exit
fi
# INFO: check wireguard connection
if [[ $(nmcli | grep "connected to wireguard" | wc -c) -eq 0 ]];
then
    echo "󰷖 "
    exit
fi

# INFO: check packetloss
packet_loss=$( ping -w 1 archlinux.org 2>/dev/null | grep "0% packet loss" | wc -c )
if [[ "${packet_loss}" -eq 0 ]];
then
    echo "%{F#fff38ba8}󰌆 "
else
    echo "%{F#f5c2e7}󰌆 "
fi
