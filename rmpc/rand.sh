#!/bin/bash
export PATH="/home/jackson/.cargo/bin:$PATH"
rmpc togglerandom 

RAND=$(rmpc status)
DISPLAY=$(echo "$RAND" | jq -r '.random')
notify-send "Random: ""$DISPLAY"
