CURSPACE=$(yabai -m query --spaces | jq '.[] | select(.["has-focus"] == true)')

TYPE=$(echo $CURSPACE | jq '.type')
INDEX=$(echo $CURSPACE | jq '.index')

if [ "$TYPE" = '"bsp"' ]; then
    yabai -m config --space $INDEX layout stack
else
    yabai -m config --space $INDEX layout bsp
fi
