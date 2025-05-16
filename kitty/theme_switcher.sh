#!/usr/bin/bash

# Configuration
KITTY_CONFIG_DIR="$XDG_CONFIG_HOME/kitty/"
THEMES_DIR="$KITTY_CONFIG_DIR/themes/themes"
# CONFIG_FILE="$KITTY_CONFIG_DIR/kitty.conf"

SYMLINK="$KITTY_CONFIG_DIR/theme.conf"

# Save original
original=$(readlink -f "$SYMLINK" | xargs basename -s .conf)

# Use fzf with live preview
# selected=$(find "$THEMES_DIR" -name "*.conf" -exec basename -s .conf {} \; | \
#     fzf --prompt="Theme: " \
#         --height 10 \
#         --preview "ln -sf $THEMES_DIR/{}.conf $SYMLINK 2>/dev/null; pkill -USR1 kitty 2>/dev/null")


# ##############################
# Use fzf with inline preview
find "$THEMES_DIR" -name "*.conf" -exec basename -s .conf {} \; | \
fzf --prompt="Theme: " \
    --height 20 \
    --border rounded \
    --margin 1,2 \
    --padding 1 \
    --no-info \
    --separator "" \
    --layout reverse \
    --preview "
        ln -sf $THEMES_DIR/{}.conf $SYMLINK 2>/dev/null
        pkill -USR1 kitty 2>/dev/null
        echo '=== {}.conf ==='
        echo ''
        cat $THEMES_DIR/{}.conf
    " \
    --preview-window "right:50%:border-rounded:wrap"
# ##############################

# Check if user actually selected something (not cancelled)
if [ -n "$selected" ]; then
    # Selection was made - theme is already applied by preview
    echo "Applied: $selected"
else
    # User cancelled (ESC) - restore original theme
    ln -sf "$THEMES_DIR/$original.conf" "$SYMLINK"
    pkill -USR1 kitty 2>/dev/null
    echo "Cancelled - Restored: $original"
fi
