#!/bin/bash

flatpak run io.github.vemonet.EmojiMart --theme dark &

SCREEN_WIDTH=$(hyprctl monitors -j | jq '.[0].width')
SCREEN_HEIGHT=$(hyprctl monitors -j | jq '.[0].height')

CENTER_X=$((SCREEN_WIDTH / 2))
CENTER_Y=$((SCREEN_HEIGHT / 2))

hyprctl dispatch movecursor "$CENTER_X" "$CENTER_Y"
