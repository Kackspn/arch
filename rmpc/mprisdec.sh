#!/bin/bash


# Decrease volume by 5% (0.05 on a scale of 0.0 to 1.0)
playerctl volume 0.02-

# Get current volume float (e.g., 0.65) and convert to a whole number percentage (e.g., 65)
CUR=$(playerctl volume | awk '{printf "%.0f", $1 * 100}')

# Send notification (changed synchronous tag to volume_notif to prevent overlapping with brightness)
notify-send -t 1500 -u low "Player Volume" "Level: ${CUR}%" -h int:value:"$CUR" -h string:x-canonical-private-synchronous:volume_notif

exit 0
