#!/bin/bash
export PATH="/home/jackson/.cargo/bin:$PATH"
rmpc togglerepeat

REPEAT=$(rmpc status)
DISPLAY=$(echo "$REPEAT" | jq -r '.repeat')
notify-send "Repeat: ""$DISPLAY"
