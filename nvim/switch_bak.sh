#!/usr/bin/zsh

set -e
# XDG_CONFIG_HOME="$HOME/.config"
# XDG_CACHE_HOME="$HOME/.cache"
# XDG_DATA_HOME="$HOME/.local/share"
# XDG_STATE_HOME="$HOME/.local/state"

CONFIG_BASE="$HOME/dotfiles/nvim"
RUNTIME_BASE="$CONFIG_BASE/runtimes"

TARGET_CONFIG="$HOME/.config/nvim"
TARGET_SHARE="$HOME/.local/share/nvim"
TARGET_STATE="$HOME/.local/state/nvim"
TARGET_CACHE="$HOME/.cache/nvim"

# Get currently active config name (basename of symlink target)
if [ -L "$TARGET_CONFIG" ]; then
  current_config=$(basename "$(readlink -f "$TARGET_CONFIG")")
  echo "📌 Current Neovim config: $current_config"
else
  echo "📌 Current Neovim config: (none)"
  current_config=""
fi
echo ""

# List available configs
configs=$(find "$CONFIG_BASE" -mindepth 1 -maxdepth 1 -type d \
  ! -name ".*" ! -name "runtimes" ! -name "switch.sh" -exec basename {} \; | sort)

# Use fzf with preview (README.md or init.lua)
selected=$(echo "$configs" | fzf \
  --prompt="Choose Neovim config: " \
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

if [[ -z "$selected" ]]; then
  echo "❌ No config selected. Aborting."
  exit 1
fi

echo "🔁 Switching to: $selected"

selected_config_path="$CONFIG_BASE/$selected"
selected_runtime_path="$RUNTIME_BASE/$selected"

# 📦 Save current runtime (if this is not first time and not same config)
if [[ -n "$current_config" && "$current_config" != "$selected" ]]; then
  echo "📦 Saving current runtime folders to: $RUNTIME_BASE/$current_config"

  mkdir -p "$RUNTIME_BASE/$current_config"
  for kind in share state cache; do
    src="$HOME/.local/$kind/nvim"
    dst="$RUNTIME_BASE/$current_config/$kind"

    if [ -e "$src" ] && [ ! -L "$src" ]; then
      echo "  ➜ Moving $src → $dst"
      mkdir -p "$(dirname "$dst")"
      mv "$src" "$dst"
    fi
  done
fi

# 🪄 Create runtime dirs if they don't exist
echo "📂 Ensuring runtime dirs for $selected exist"
mkdir -p "$selected_runtime_path"/{share,state,cache}

# 🔗 Link config and runtime
echo "🔗 Linking Neovim config and runtime..."
ln -sfn "$selected_config_path" "$TARGET_CONFIG"
ln -sfn "$selected_runtime_path/share" "$TARGET_SHARE"
ln -sfn "$selected_runtime_path/state" "$TARGET_STATE"
ln -sfn "$selected_runtime_path/cache" "$TARGET_CACHE"

echo ""
echo "✅ Done!"
echo "→ Config:     $TARGET_CONFIG → $selected_config_path"
echo "→ Share dir:  $TARGET_SHARE → $selected_runtime_path/share"
echo "→ State dir:  $TARGET_STATE → $selected_runtime_path/state"
echo "→ Cache dir:  $TARGET_CACHE → $selected_runtime_path/cache"
echo ""
echo "🚀 Launch Neovim: nvim"
