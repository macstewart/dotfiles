#!/usr/bin/env bash

sel=any.floating.!hidden.local
x=16
y=9
case $# in
  0) ;;
  1) sel=$1;;
  2) x=$1 y=$2;;
  3) sel=$1 x=$2 y=$3;;
  *) exit 1;;
esac

node=($(bspc query -T -n $sel | jq -r .client.floatingRectangle.width,.client.floatingRectangle.height))
scalew=$(printf "%.0f" $(echo "scale=4;${node[1]}*$x/$y" | bc))
bspc node $sel -z right $((scalew-node[0])) 0 
