#!/bin/bash

# Check if "wlp2s0" is disconnected
if [[ $(nmcli | grep "wlp2s0: disconnected") -eq 0 ]]; then
    nmcli d disconnect wlp2s0
else
    nmcli d connect wlp2s0
fi

