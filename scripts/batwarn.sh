#!/bin/bash
while true
do
    cs=`cat /sys/class/power_supply/BAT0/status`
    cp=`expr "$(cat /sys/class/power_supply/BAT0/capacity)"`
    if [ $cs = "Discharging" ] && [ $cp \< 16 ]; then
        notify-send -u critical "Low battery" "$(echo $cp)% remaining"
        paplay ~/.config/dunst/lowbattery.wav
    fi
    sleep 300
done
