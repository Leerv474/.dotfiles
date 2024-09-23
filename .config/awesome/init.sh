#/bin/sh
xrandr --output eDP --mode 1920x1080 --rate 75
xrandr --output DisplayPort-1 --mode 1920x1080 --rate 75
setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,ru
setxkbmap -option caps:ctrl_modifier
xbindkeys &
