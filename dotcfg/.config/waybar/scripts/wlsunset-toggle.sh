#!/bin/bash

if pgrep -x "wlsunset" > /dev/null; then
    pkill wlsunset
else
    # Please enter your latitude (-l) and longitude (-L) values corresponding to your actual location.
    wlsunset -l 41.0 -L 29.0 &
fi
