#!/bin/bash

function run {
    if ! pgrep -f $1 ;
    then
        $@&
    fi
}

## Startup apps
picom &
killall -q polybar

if [[ $(xrandr -q | grep -w 'DP-1 connected') ]]; then
    xrandr --output DP-1 --auto
    xrandr -r 75
    xrandr --output eDP-1 --off
    polybar main &
fi
if [[ $(xrandr -q | grep -w 'DP-1 disconnected') ]]; then
    xrandr --output eDP-1 --mode 1920x1080 --rate 70
    polybar main &
fi


# xbindkeys for shortcuts
run xbindkeys &
# switch languages with alt+shift
setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,ru
setxkbmap -option caps:ctrl_modifier
setxkbmap -option altwin:swap_alt_win

# set sleep times
# xautolock -locker "systemctl suspend" -time 10 &

