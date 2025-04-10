#!/bin/bash

# Settings
LATITUDE="41.0082"
LONGITUDE="28.9784"
DAY_TEMP="6500"
NIGHT_TEMP="4000"
GAMMA="1.0"
DURATION="3600"

if pgrep -x "wlsunset" >/dev/null; then
  pkill -x "wlsunset"
else
  wlsunset -l "$LATITUDE" -L "$LONGITUDE" -t "$NIGHT_TEMP" -T "$DAY_TEMP" -g "$GAMMA" -d "$DURATION" &
fi
