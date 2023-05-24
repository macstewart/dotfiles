#!/usr/bin/env bash

index=$1

if [[ -z $index ]]; then
    echo "no index provided"
    exit 0
fi

windows=$(yabai -m query --spaces --space $index | jq -r 'select(( ."has-focus"  != true and .windows != []))')

if [[ -z $windows ]]; then
    echo "no windows in space"
    exit 0
fi

window_id=$(jq -r '."first-window"' <<< $windows)

if (( $window_id==0 )); then
    window_id=$(jq -r '.windows[0]' <<< $windows)
fi

echo "focusing window $window_id"

yabai -m window --focus $window_id
