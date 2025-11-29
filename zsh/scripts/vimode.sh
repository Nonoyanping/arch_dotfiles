bindkey -v

# Press 'jk' to exit Insert mode
# bindkey -M viins 'kk' vi-cmd-mode
bindkey -M viins 'jj' vi-cmd-mode

# Explicitly bind C-r for fzf
# bindkey '^r' fzf-history-widget



# ================================================
# VIM MODE CONFIGURATION FOR ZSH
# ================================================
# This script enables vim-style editing in zsh with:
# - Visual cursor feedback (beam in insert, block in normal)
# - Comprehensive keybindings
# - Text objects support
# - Enhanced navigation
# ================================================

# ===== ENABLE VIM MODE =====
bindkey -v

# Reduce ESC delay to 10ms (in 1/100 seconds)
export KEYTIMEOUT=1

# ===== CURSOR SHAPE CONFIGURATION =====
# Change cursor shape based on vim mode

function zle-keymap-select {
  case $KEYMAP in
    vicmd)
      # Normal mode - Steady block cursor
      echo -ne '\e[2 q'
      ;;
    viins|main)
      # Insert mode - Steady beam cursor
      echo -ne '\e[6 q'
      ;;
    visual)
      # Visual mode - Steady block cursor (same as normal)
      echo -ne '\e[2 q'
      ;;
  esac
}
zle -N zle-keymap-select

# Initialize with beam cursor on shell start (insert mode)
function zle-line-init {
  zle -K viins  # Initiate insert mode
  echo -ne "\e[6 q"
}
zle -N zle-line-init

# Beam cursor when starting shell
echo -ne '\e[6 q'

# Restore beam cursor after command execution
preexec() {
  echo -ne '\e[6 q'
}

# ===== EDIT COMMAND LINE IN EDITOR =====
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# ===== TEXT OBJECTS =====
# Enable vim-style text objects (ci", da(, etc.)
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

# ===== HISTORY SEARCH =====
# Incremental history search (works in both modes)
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '^R' history-incremental-search-backward
bindkey -M viins '^S' history-incremental-search-forward
bindkey -M vicmd '^S' history-incremental-search-forward

# History search with partial match
bindkey -M viins '^P' up-line-or-search
bindkey -M viins '^N' down-line-or-search
bindkey -M vicmd 'k' up-line-or-search
bindkey -M vicmd 'j' down-line-or-search

# ===== NAVIGATION KEYBINDINGS =====
# Home and End keys
bindkey -M viins '^[[H' beginning-of-line
bindkey -M viins '^[[F' end-of-line
bindkey -M vicmd '^[[H' beginning-of-line
bindkey -M vicmd '^[[F' end-of-line
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line

# Alt-Left/Right for word navigation (insert mode)
bindkey -M viins '^[[1;3D' backward-word
bindkey -M viins '^[[1;3C' forward-word

# ===== DELETION KEYBINDINGS =====
# Backspace and Delete
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^[[3~' delete-char
bindkey -M vicmd '^[[3~' delete-char
bindkey -M vicmd 'x' delete-char

# Ctrl-W to delete word backwards
bindkey -M viins '^W' backward-kill-word

# Ctrl-U to delete to beginning of line
bindkey -M viins '^U' backward-kill-line

# Ctrl-K to delete to end of line
bindkey -M viins '^K' kill-line

# ===== UNDO/REDO =====
bindkey -M vicmd 'u' undo
bindkey -M vicmd '^R' redo

# ===== PASTE =====
# Ctrl-Y to paste (yank)
bindkey -M viins '^Y' yank

# ===== ADDITIONAL USEFUL BINDINGS =====
# Accept line with Ctrl-J or Ctrl-M (Enter)
bindkey -M viins '^J' accept-line
bindkey -M viins '^M' accept-line

# Clear screen with Ctrl-L
bindkey -M viins '^L' clear-screen
bindkey -M vicmd '^L' clear-screen

# Tab completion (keep working in both modes)
bindkey -M viins '^I' expand-or-complete
bindkey -M vicmd '^I' expand-or-complete

# ===== VISUAL MODE ENHANCEMENTS =====
# Better visual mode
autoload -Uz select-word-style
select-word-style bash

# ===== SURROUND PLUGIN (OPTIONAL BUT AWESOME) =====
# Allows operations like cs"' (change surrounding " to ')
# ysiw" (surround word with ")
# ds" (delete surrounding ")
autoload -Uz surround
zle -N delete-surround surround
zle -N change-surround surround
zle -N add-surround surround

bindkey -M vicmd 'cs' change-surround
bindkey -M vicmd 'ds' delete-surround
bindkey -M vicmd 'ys' add-surround
bindkey -M visual 'S' add-surround

# ===== MODE INDICATOR (optional - for debugging) =====
# Uncomment if you want to see which mode you're in
# function zle-line-pre-redraw {
#   case $KEYMAP in
#     vicmd)      VI_MODE="[N]" ;;
#     viins|main) VI_MODE="[I]" ;;
#     visual)     VI_MODE="[V]" ;;
#     *)          VI_MODE="[?]" ;;
#   esac
# }
# zle -N zle-line-pre-redraw
