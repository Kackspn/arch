#!/bin/bash
export PATH="/home/jackson/.cargo/bin:$PATH"

PAUSED=$(rmpc status)
DISPLAY=$(echo "$PAUSED" | jq -r '.state')
notify-send "$DISPLAY"
