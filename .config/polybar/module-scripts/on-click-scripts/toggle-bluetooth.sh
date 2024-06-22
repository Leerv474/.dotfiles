#!/bin/sh

# Check if Bluetooth is on
if bluetoothctl show | grep -q "Powered: yes"; then
    # If Bluetooth is on, turn it off
    bluetoothctl power off
    exit
else
    # If Bluetooth is off, turn it on
    bluetoothctl power on
    exit
fi

