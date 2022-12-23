#!/usr/bin/env bash
if [[ "$(systemctl status bluetooth | grep Active)" =~ "Active: inactive (dead)" ]]; then
    sudo systemctl start bluetooth
else
    sudo systemctl stop bluetooth
fi
