#!/usr/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/Wallpapers/nono_collections/"

# Create directory if it doesn't exist
if [ ! -d "$WALLPAPER_DIR" ]; then
  mkdir -p "$WALLPAPER_DIR"
  echo "Created wallpaper directory at $WALLPAPER_DIR"
  echo "Please add some wallpapers to this directory"
  exit 1
fi

# Check if swww daemon is running
if ! pgrep -x "swww-daemon" >/dev/null; then
  swww-daemon
fi

# Available transition effects
TRANSITIONS=("simple" "wipe" "wave" "grow" "outer" "random")

# Random transition effect
TRANSITION=${TRANSITIONS[$RANDOM % ${#TRANSITIONS[@]}]}

# Find all image files
WALLPAPERS=($(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \)))

# Check if wallpapers were found
if [ ${#WALLPAPERS[@]} -eq 0 ]; then
  echo "No wallpapers found in $WALLPAPER_DIR"
  exit 1
fi

# Select random wallpaper
WALLPAPER=${WALLPAPERS[$RANDOM % ${#WALLPAPERS[@]}]}

# Apply wallpaper with transition effect
swww img "$WALLPAPER" \
  --transition-type "$TRANSITION" \
  --transition-duration 2 \
  --transition-fps 60 \
  --transition-step 90 \
  --transition-bezier 0.65,0,0.35,1

echo "Applied wallpaper: $WALLPAPER with $TRANSITION transition"
