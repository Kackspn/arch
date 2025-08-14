#!/bin/bash

set +e

dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
/usr/lib/xdg-desktop-portal-wlr &

waybar -c ~/.config/waybar/waybarmango/config -s ~/.config/waybar/waybarmango/style.css &
