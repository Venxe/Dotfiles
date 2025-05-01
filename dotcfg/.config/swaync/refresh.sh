#!/bin/bash

if pgrep -x swaync > /dev/null; then
    swaync-client -t -sw
else
    swaync &
    sleep 0.5
    swaync-client -t -sw
fi
