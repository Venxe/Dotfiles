#!/bin/bash

set -euo pipefail

# Settings
readonly LATITUDE="41.0082"
readonly LONGITUDE="28.9784"
readonly DAY_TEMP="6500"
readonly NIGHT_TEMP="3000"
readonly ICON=""

toggle_gammastep() {
    if pgrep -x gammastep &>/dev/null; then
        pkill gammastep
    else
        gammastep -l "${LATITUDE}:${LONGITUDE}" -t "${DAY_TEMP}:${NIGHT_TEMP}" &
    fi
}

get_status() {
    if pgrep -x gammastep &>/dev/null; then
        printf '{"text": "<span foreground='\''#FFAA00'\''>%s</span>", "tooltip": "NightMode: On"}\n' "$ICON"
    else
        printf '{"text": "<span foreground='\''#AAAAAA'\''>%s</span>", "tooltip": "NightMode: Off"}\n' "$ICON"
    fi
}

main() {
    case "${1:-}" in
        toggle) toggle_gammastep ;;
        *)      get_status ;;
    esac
}

main "$@"
