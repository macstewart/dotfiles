#!/usr/bin/env bash
# It would be more efficient to only calculate the positions that are needed but this is a bit cleaner

# modes
# empty = toggle
# 1 = tiled
# 2 = float
if [ $# -eq 1 ]; then
    case $1 in
        1) target="tiled";;
        2) target="floating";;
        *) exit 1;;
    esac
fi

current=$(bspc query -T -n | jq -r '.client.state')
if [ -z $current ]; then
    exit 0
fi

if [ -z $target ]; then
    case $current in
        floating) target="tiled";;
        *) target="floating";;
    esac
elif [ $current = $target ]; then
    exit 0
fi

# use || because sticky windows sometimes don't get returned by "last" after swapping desktops
bspc node last.local.$target -f || bspc node any.local.$target -f
