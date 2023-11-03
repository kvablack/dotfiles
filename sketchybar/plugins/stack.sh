#!/bin/bash

ANIM="--animate quadratic 5"

TYPE=$(yabai -m query --spaces --space | jq '.["type"]')

if [[ "$TYPE" = '"stack"' ]]; then
    CURRENT=$(yabai -m query --windows --window | jq '.["stack-index"]')

    declare -a dots=()
    if [[ $CURRENT -eq 0 ]]; then
        # Single window
        dots+="●"
    else
        # Multiple window
        LAST=$(yabai -m query --windows --window stack.last | jq '.["stack-index"]')

        for i in $(seq 0 $(expr $LAST - 1))
        do  
          # Theme 1
          # if [[ $i -lt $(expr $CURRENT - 1) ]]; then
            # dots+="◖"
          # elif [[ $i -gt $(expr $CURRENT - 1) ]]; then
            # dots+="◗"
          # elif [[ $i -eq $(expr $CURRENT - 1) ]]; then
            # dots+="●"
          # fi
          # Theme 2
          [[ $( expr $CURRENT - 1) -eq $i ]] && dots+="●" || dots+="○"
        done
    fi

    sketchybar $ANIM --set stack label=$(printf "%s" ${dots[@]})
else
    sketchybar --set stack label=""
fi
