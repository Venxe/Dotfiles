#!/usr/bin/env bash

if killall -SIGUSR1 waybar 2>/dev/null; then
    exit 0
fi

if pgrep -x waybar >/dev/null; then
    pkill -x waybar
else
    waybar & disown
fi
