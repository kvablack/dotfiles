#!/bin/bash

windows_on_spaces () {
  CURRENT_SPACES="$(yabai -m query --displays | jq -r '.[].spaces | @sh')"

  args=(--set spaces_bracket drawing=off
        --set '/space\..*/' background.drawing=on
        --animate sin 10)

  while read -r line
  do
    for space in $line
    do
      icon_strip=" "
      raw_apps=$(yabai -m query --windows --space $space | jq -r ".[].app")
      if [ "${raw_apps}" != "" ]; then
        unique_apps="$(echo "${raw_apps}" | sort | uniq -i)"
        while read -r app
        do
          icon_strip+=" $($CONFIG_DIR/plugins/icon_map.sh "$app")"
        done <<< "${unique_apps}"
      else
        icon_strip=" —"
      fi
      args+=(--set space.$space label="$icon_strip" label.drawing=on)
    done
  done <<< "$CURRENT_SPACES"

  sketchybar -m "${args[@]}"
}

case "$SENDER" in
  "forced") exit 0
  ;;
  "windows_on_spaces" | "space_change" | "front_app_switched") windows_on_spaces
  ;;
esac
