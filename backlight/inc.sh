#!/bin/bash

BACKLIGHT="/sys/class/backlight/intel_backlight/brightness"

MIN=9600
MAX=96000
STEP=960

CUR=$(cat "$BACKLIGHT")
NEW=$((CUR + STEP))


if ((NEW >= MAX)); then
  NEW=$MAX
fi
RANGE=$((MAX-MIN))
PER=0

CV=$((NEW-MIN))
PER=$((CV * 100 / RANGE))

if ((PER>=MAX)); then
  PER=100
fi
echo "$NEW" > "$BACKLIGHT"


if ((PER < 0)); then PER=0; fi
if ((PER > 100)); then PER=100; fi
notify-send -t 1500 -u low "Brightness" "Level: ${PER}%" -h int:value:"$PER" -h string:x-canonical-private-synchronous:brightness_notif


exit 0
