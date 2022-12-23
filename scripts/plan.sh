#!/bin/bash
if [[ $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor) == 'powersave' ]]; then
    echo '%{F#0f0}%{F-}'
else
    echo '%{F#f62817}%{F-}'
fi
