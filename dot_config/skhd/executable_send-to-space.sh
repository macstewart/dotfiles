#!/usr/bin/env bash

space=$1
focus=$2

if [[ -z $space ]]; then
    exit 0
fi

window=$(yabai -m query --windows --window | jq -r '.id')
yabai -m window --space $1

if [[ $focus ]]; then
    yabai -m window --focus $window
fi
