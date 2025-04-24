#!/usr/bin/zsh
CONFIG_BASE="$HOME/dotfiles/fastfetch/configs/"

TARGET_CONFIG="$HOME/.config/fastfetch/config.jsonc"

# Get currently active config name (basename of symlink target)
if [ -L "$TARGET_CONFIG" ]; then
  current_config=$(basename "$(readlink -f "$TARGET_CONFIG")")
  echo "📌 Current Fastfetch config: $current_config"
else
  echo "📌 Current Fastfetch config: (none)"
  current_config=""
fi
echo ""

# List available .jsonc files (excluding hidden files)
configs=$(find "$CONFIG_BASE" -mindepth 1 -maxdepth 1 -type f \
  -name "*.jsonc" ! -name ".*" -exec basename {} \; | sort)

# Use fzf with preview (README.md or init.lua)
selected=$(echo "$configs" | fzf \
  --prompt="Choose Fastfetch config: " \
  --height=50% --border \
  --preview "
if [ -f $CONFIG_BASE/{}/README.md ]; then
  bat --style=plain --color=always $CONFIG_BASE/{}/README.md
elif [ -f $CONFIG_BASE/{}/init.lua ]; then
  bat --style=plain --color=always $CONFIG_BASE/{}/init.lua
else
  echo 'No preview available'
  fi" \
  --preview-window=right:60%)

ln -sf "$HOME/dotfiles/fastfetch/configs/$selected" "$HOME/dotfiles/fastfetch/config.jsonc"
