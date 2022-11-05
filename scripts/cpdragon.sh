#!/bin/sh
files=$(dragon-drop -t -x)
for file in $files
do
    path=${file#file://}
    name=$(basename "$path")
    cp "$path" "$(pwd)/$name"
done
