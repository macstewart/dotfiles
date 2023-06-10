#!/usr/bin/env zsh
pads=($(bspc query -N -n .local.window.floating.sticky))
echo $pads
echo ${pads[1]}
echo ${pads[2]}
