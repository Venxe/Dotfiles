#!/usr/bin/env bash

check() {
  command -v "$1" &>/dev/null
}

loc="$HOME/.cache/colorpicker"
mkdir -p "$loc"
touch "$loc/colors"

limit=10

if [[ $# -eq 1 && $1 == "-l" ]]; then
  cat "$loc/colors"
  exit
fi

if [[ $# -eq 1 && $1 == "-j" ]]; then
  text="$(head -n 1 "$loc/colors")"
  [ -z "$text" ] && text="#ffffff"

  mapfile -t allcolors < <(tail -n +2 "$loc/colors")

  tooltip="<b>   COLORS</b>\\n\\n"
  tooltip+="-> <b>$text</b>  <span color='$text'></span>\\n"

  for color in "${allcolors[@]}"; do
    tooltip+="   <b>$color</b>  <span color='$color'></span>\\n"
  done

  printf '{ "text": "<span color='\''%s'\''>󰏘</span>", "tooltip": "%s" }\n' "$text" "$tooltip"
  exit
fi

check hyprpicker || {
  notify-send "Color Picker" "hyprpicker yüklü değil."
  exit
}

killall -q hyprpicker
color=$(hyprpicker)
[ -z "$color" ] && exit

check wl-copy && echo "$color" | tr -d '\n' | wl-copy

{
  echo "$color"
  head -n $((limit - 1)) "$loc/colors"
} > "$loc/colors"

sed -i '/^$/d' "$loc/colors"

source ~/.cache/wal/colors.sh 2>/dev/null
notify-send "Color Picker" "This color has been selected: $color" -i "${wallpaper:-color-picker}"

pkill -RTMIN+1 waybar
