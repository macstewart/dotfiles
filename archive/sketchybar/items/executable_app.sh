APP=(
    icon.drawing=off
    background.padding_left=0
    background.padding_right=20
    script="$PLUGIN_DIR/front_app.sh"
)

sketchybar --add item front_app left \
    --set front_app "${APP[@]}" \
    --subscribe front_app front_app_switched
