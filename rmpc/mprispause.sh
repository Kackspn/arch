#!/bin/bash

playerctl play-pause
STAT=$(playerctl status)
notify-send "$STAT"
