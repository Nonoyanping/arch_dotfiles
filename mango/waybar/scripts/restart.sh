#!/bin/bash

# Terminate existing waybar processes (only your user’s, safely)
pkill -x -u "$USER" waybar

# Optional: add small delay to ensure full termination (usually unnecessary but safe)
sleep 0.1

# Start waybar with your config
waybar -c ~/.config/mango/waybar/config.jsonc -s ~/.config/mango/waybar/style.css >/dev/null 2>&1 &
# notify-send "Waybar restarted"
