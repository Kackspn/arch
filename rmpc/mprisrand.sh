#!/bin/bash

playerctl shuffle toggle
STAT=$(playerctl shuffle)
notify-send "Shuffle: ""$STAT"
