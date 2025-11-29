#!/usr/bin/env zsh
# ================================================
# HISTORY CONFIGURATION
# ================================================

# History file location
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export HISTSIZE=50000
export SAVEHIST=50000

# ===== HISTORY OPTIONS =====
setopt EXTENDED_HISTORY          # Write timestamp to history
setopt HIST_EXPIRE_DUPS_FIRST   # Expire duplicates first
setopt HIST_IGNORE_DUPS         # Don't record duplicates
setopt HIST_IGNORE_ALL_DUPS     # Delete old duplicates
setopt HIST_FIND_NO_DUPS        # Don't display duplicates in search
setopt HIST_IGNORE_SPACE        # Ignore commands starting with space
setopt HIST_SAVE_NO_DUPS        # Don't write duplicates to file
setopt HIST_REDUCE_BLANKS       # Remove superfluous blanks
setopt HIST_VERIFY              # Show command before running from history
setopt SHARE_HISTORY            # Share history between sessions
setopt INC_APPEND_HISTORY       # Write to history immediately
setopt HIST_NO_STORE            # Don't store 'history' command

# Create history file if it doesn't exist
[[ ! -f $HISTFILE ]] && mkdir -p "$(dirname "$HISTFILE")" && touch "$HISTFILE"
