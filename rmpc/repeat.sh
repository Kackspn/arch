#!/bin/bash
export PATH="/home/jackson/.cargo/bin:$PATH"
rmpc togglesingle

REPEAT=$(rmpc status)
DISPLAY=$(echo "$REPEAT" | jq -r '.single')
notify-send "Repeat: ""$DISPLAY"
