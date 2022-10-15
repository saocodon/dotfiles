#!/bin/bash
val=`cat ~/.brightness`
val=`echo "$val+0.05" | bc`
xrandr --output eDP-1 --brightness $val
echo "$val" > ~/.brightness
