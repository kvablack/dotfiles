#!/bin/bash

stack=(
  script="$PLUGIN_DIR/stack.sh"
  drawing=on
  update_freq=0
  label.font="$FONT:Regular:14.0"
)

sketchybar -m --add item stack left \
              --set stack "${stack[@]}" \
              --subscribe stack front_app_switched space_change space_windows_change
