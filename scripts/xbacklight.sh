#!/usr/bin/env bash
val=`cat /home/duy/scripts/brightness`
val=`echo "$val*100/1" | bc`
echo "%{F#ecdcb4}盛  ${val}%%{F-}"
