#!/bin/sh

if [[ $(nmcli | grep "wireguard: connected") ]]; then
    nmcli d disconnect wireguard 
    exit
fi

nmcli con up wireguard

