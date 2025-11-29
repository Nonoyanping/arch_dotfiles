# ================================================
# ZSH VI-MODE CONFIGURATION
# ================================================
# Combines:
# - Full Vi keybindings and text objects
# - Cursor shaping
# - System clipboard (wl-clipboard)
# - Clipboard history (cliphist + fzf)
# ================================================

# 1. CORE VI SETUP
# =================
bindkey -v
export KEYTIMEOUT=1 # Reduce ESC delay to 10ms

# 'jj' to exit Insert mode
bindkey -M viins 'jj' vi-cmd-mode

# 2. SYSTEM CLIPBOARD (wl-clipboard)
# ===================================
# Make 'y' (yank) and 'p' (paste) use the system clipboard
vi-yank-wl() {
    zle .vi-yank
    echo -n "$CUTBUFFER" | wl-copy
}
vi-paste-after-wl() {
    RBUFFER="$(wl-paste --no-newline)${RBUFFER}"
}
vi-paste-before-wl() {
    LBUFFER+="$(wl-paste --no-newline)"
}
zle -N vi-yank-wl
zle -N vi-paste-after-wl
zle -N vi-paste-before-wl

# Map keys in 'vicmd' (Vi Command Mode)
bindkey -M vicmd 'y' vi-yank-wl
bindkey -M vicmd 'p' vi-paste-after-wl
bindkey -M vicmd 'P' vi-paste-before-wl


# 3. CLIPBOARD HISTORY (cliphist + fzf)
# ======================================
# ZLE widget to paste from cliphist via fzf
paste-from-history() {
  local item
  item=$(cliphist list | fzf | cliphist decode)
  if [[ -n "$item" ]]; then
    LBUFFER+="$item"
  fi
  zle .redisplay # Refresh the line
}
zle -N paste-from-history

# Bind Ctrl+P in *both* modes
bindkey -M viins '^P' paste-from-history
bindkey -M vicmd '^P' paste-from-history


# 4. EDIT IN EXTERNAL EDITOR (v)
# =================================
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line


# 5. ADVANCED VI FEATURES (Text Objects & Surround)
# =================================================
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed

# Bind text objects in visual and operator-pending modes
for km in viopp visual; do
  # Quote text objects: ', ", `, etc.
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  # Bracket text objects: (), [], {}, <>, etc.
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done

# 'surround' plugin (cs, ds, ys)
autoload -Uz surround
zle -N delete-surround surround
zle -N change-surround surround
zle -N add-surround surround

bindkey -M vicmd 'cs' change-surround
bindkey -M vicmd 'ds' delete-surround
bindkey -M vicmd 'ys' add-surround
bindkey -M visual 'S' add-surround


# 6. HISTORY SEARCH & NAVIGATION
# ==============================
# Incremental history search (Ctrl+R / Ctrl+S)
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '^R' history-incremental-search-backward
bindkey -M viins '^S' history-incremental-search-forward
bindkey -M vicmd '^S' history-incremental-search-forward

# History search with partial match (j/k and Ctrl+N)
# Note: ^P is now used for cliphist
bindkey -M viins '^N' down-line-or-search
bindkey -M vicmd 'k' up-line-or-search
bindkey -M vicmd 'j' down-line-or-search

# Standard Emacs-style navigation
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line

# Home and End keys
bindkey -M viins '^[[H' beginning-of-line
bindkey -M viins '^[[F' end-of-line
bindkey -M vicmd '^[[H' beginning-of-line
bindkey -M vicmd '^[[F' end-of-line

# Alt-Left/Right for word navigation
bindkey -M viins '^[[1;3D' backward-word
bindkey -M viins '^[[1;3C' forward-word


# 7. DELETION KEYBINDINGS
# ========================
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^[[3~' delete-char
bindkey -M vicmd '^[[3~' delete-char
bindkey -M vicmd 'x' delete-char
bindkey -M viins '^W' backward-kill-word
bindkey -M viins '^U' backward-kill-line
bindkey -M viins '^K' kill-line


# 8. OTHER KEYBINDINGS
# ======================
# Undo/Redo
bindkey -M vicmd 'u' undo
bindkey -M vicmd '^R' redo # Note: This overrides history search in vicmd

# Accept line (Enter)
bindkey -M viins '^J' accept-line
bindkey -M viins '^M' accept-line

# Clear screen
bindkey -M viins '^L' clear-screen
bindkey -M vicmd '^L' clear-screen

# Tab completion
bindkey -M viins '^I' expand-or-complete
bindkey -M vicmd '^I' expand-or-complete


# 9. (OPTIONAL) MODE INDICATOR
# ============================
# Uncomment to show [N], [I], [V] in your prompt
#
# function zle-line-pre-redraw {
#   case $KEYMAP in
#     vicmd)      VI_MODE="[N]" ;;
#     viins|main) VI_MODE="[I]" ;;
#     visual)     VI_MODE="[V]" ;;
#     *)          VI_MODE="[?]" ;;
#   esac
#   zle-line-init
# }
# zle -N zle-line-pre-redraw
#
# # Add $VI_MODE to your PROMPT or RPROMPT
# # Example: RPROMPT="$VI_MODE"
