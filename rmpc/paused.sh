#!/bin/bash
export PATH="/home/jackson/.cargo/bin:$PATH"
rmpc togglepause

PAUSED=$(rmpc status)
DISPLAY=$(echo "$PAUSED" | jq -r '.state')
notify-send "$DISPLAY"
