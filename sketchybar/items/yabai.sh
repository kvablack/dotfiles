#!/bin/bash

yabai=(
  icon=""
  label=""
  script="$PLUGIN_DIR/yabai.sh"
  associated_display=active
)

sketchybar --add event windows_on_spaces       \
           --add item yabai left               \
           --set yabai "${yabai[@]}"           \
           --subscribe yabai windows_on_spaces front_app_switched
