#!/usr/bin/env bash

state=$(playerctl status 2> /dev/null)
name=$(playerctl metadata --format "{{ artist }} - {{ title }}" 2> /dev/null)
if [[ ${#name} -gt 30 ]]; then
    name=${name:0:30}...
fi

if [[ $state == "" ]]; then
    echo ""
elif [[ $state =~ "Playing" ]]; then
    if [[ $name =~ "- Firefox is playing media" ]]; then
        echo "%{F#ecdcb4}%{A1:playerctl previous:}玲%{A}  %{A1:playerctl pause:} %{A}  %{A1:playerctl next:}怜%{A}  Incognito%{F-}"
    else
        echo "%{F#ecdcb4}%{A1:playerctl previous:}玲%{A}  %{A1:playerctl pause:} %{A}  %{A1:playerctl next:}怜%{A}  ${name}%{F-}"
    fi
else
    if [[ $name =~ "- Firefox is playing media" ]]; then
        echo "%{F#ecdcb4}%{A1:playerctl previous:}玲%{A}  %{A1:playerctl play:}奈 %{A}  %{A1:playerctl next:}怜%{A}  Incognito%{F-}"
    else
        echo "%{F#ecdcb4}%{A1:playerctl previous:}玲%{A}  %{A1:playerctl play:}奈 %{A}  %{A1:playerctl next:}怜%{A}  ${name}%{F-}"
    fi
fi

