#!/usr/bin/env bash
# It would be more efficient to only calculate the positions that are needed but this is a bit cleaner

# TODO use focused window if it is floating
currentSel=focused.floating
sel=any.floating.local.!hidden

if [ $# -ne 1 ]; then
    # TODO use notify
    exit 1
fi

# window width/height
read wWidth wHeight wId < <(echo $(bspc query -T -n $currentSel | jq -c '(.client.floatingRectangle.width, .client.floatingRectangle.height, .id)'))
if [ -z $wId ]; then
    read wWidth wHeight wId < <(echo $(bspc query -T -n $sel | jq -c '(.client.floatingRectangle.width, .client.floatingRectangle.height, .id)'))
fi
if [ -z $wId ]; then
    echo "no floating windows found"
    exit 1
fi

# display window gaps / border / width / height
read gap border dWidth dHeight < <(echo $(bspc query -m -T | jq -c '(.windowGap, .borderWidth, .rectangle.width, .rectangle.height)'))
gapOffset=$((gap + border - 1))
xOffset=$((dWidth - gapOffset - wWidth))
yOffset=$((dHeight - gapOffset - wHeight))

# snap corners
#  1  2
#  3  4
case $1 in
  1) x=$gapOffset; y=$gapOffset;;
  2) x=$xOffset; y=$gapOffset;;
  3) x=$gapOffset; y=$yOffset;;
  4) x=$xOffset; y=$yOffset;;
  *) exit 1;;
esac
id=$(printf 0x%x $wId)
echo $id
xdo move -x $x -y $y $id
