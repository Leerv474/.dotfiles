#!/bin/sh
# NAME
#     volume.sh - Increase/decrease/mute volume
# SYNOPSIS 
#     volume.sh <raise|lower|mute>
# Suggested location: ~/scripts/volume.sh

step=5   # number of percentage points to increase/decrease volume

# Select EITHER the `amixer` or the `pactl` command in each case
if [ $1 == "raise" ]; then
  pactl set-sink-volume @DEFAULT_SINK@ "+${step}%"
  
elif [ $1 == "lower" ]; then
  pactl set-sink-volume @DEFAULT_SINK@ "-${step}%"
  
elif [ $1 == "mute" ]; then
  pactl set-sink-mute @DEFAULT_SINK@ toggle
  
else
  echo "Unrecognized parameter: ${1}"
  echo "Usage should be: volume.sh <raise|lower|mute>"
fi


