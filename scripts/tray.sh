#!/usr/bin/env bash
if [[ $(pgrep stalonetray) ]]; then
    pkill stalonetray
else
    stalonetray &
fi
