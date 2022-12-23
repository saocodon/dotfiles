#!/usr/bin/env bash
if [[ "$(systemctl status bluetooth | grep Active)" =~ "Active: inactive (dead)" ]]; then
    echo "%{F#666}%{F-}"
else
    dev=`bluetoothctl devices Connected`
    if [[ ${dev##* } == "" ]]; then
        echo "%{F#ecdcb4}%{F-}"
    else
        echo "%{F#ecdcb4} ${dev##* }%{F-}"
    fi
fi
