#!/bin/bash

# Fushicai USBTV007 Video Grabber does not retain settings from v4l2-ctl.
# This script watches for hyperion opening the device and then issues the
# v4l2-ctl commands after it has been opened.
VIDEO=/dev/video0
SATURATION=300

echo "watching $VIDEO"
while sleep 1; do
    if inotifywait -e open $VIDEO; then
        echo "setting saturation to $SATURATION for $VIDEO"
        v4l2-ctl --set-ctrl saturation=$SATURATION -d $VIDEO
    fi
done
