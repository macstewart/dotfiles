#!/usr/bin/env bash

swap_selector=$1
follow=$2

if [[ -z $swap_selector ]]; then
    exit 0
fi

# swap_window=$(yabai -m query --windows --window $swap_selector | jq -r '.id')

current=$(yabai -m query --windows --window | jq -r '.id')
yabai -m window --swap $swap_selector

if [[ -z $follow ]]; then
    yabai -m window --focus $swap_selector
fi
