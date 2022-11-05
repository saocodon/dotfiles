#!/bin/bash

if [[ "$(ibus engine)" = "BambooUs::Flag" ]]; then
    ibus engine Bamboo::Us
else
    ibus engine BambooUs::Flag
fi
