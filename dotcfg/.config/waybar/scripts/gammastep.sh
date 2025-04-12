#!/bin/bash

set -euo pipefail

# Settings
readonly LATITUDE="41.0082"
readonly LONGITUDE="28.9784"
readonly DAY_TEMP="3000"
readonly NIGHT_TEMP="3000"
readonly ICON=" \u0020"

toggle_gammastep() {
    if pgrep -x gammastep > /dev/null; then
        pkill gammastep
    else
        gammastep -l "${LATITUDE}:${LONGITUDE}" -t "${DAY_TEMP}:${NIGHT_TEMP}" &
    fi
}

get_status() {
    if pgrep -x gammastep > /dev/null; then
        echo "{\"text\": \"<span foreground='#FFAA00'>${ICON}</span>\", \"tooltip\": \"NightMode: On\"}"
    else
        echo "{\"text\": \"<span foreground='#AAAAAA'>${ICON}</span>\", \"tooltip\": \"NightMode: Off\"}"
    fi
}

main() {
    case "${1:-}" in
        toggle)
            toggle_gammastep
            ;;
        *)
            get_status
            ;;
    esac
}

main "$@"
