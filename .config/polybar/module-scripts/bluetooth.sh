#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo "%{F#66ffffff}"
else
  if [ $(bluetoothctl info | grep 'Connected: yes' | wc -c) -eq 0 ]
  then 
    echo ""
  fi
  echo "%{F#2193ff}"
fi
