#!/usr/bin/env zsh
# ================================================
# STARSHIP PROMPT
# ================================================

# Only load if starship exists
command -v starship >/dev/null 2>&1 || return

# Prevent double-init
[[ -v STARSHIP_INITED ]] && return
STARSHIP_INITED=1

# Set config path
export STARSHIP_CONFIG="$HOME/dotfiles/starship/starship.toml"

# Initialize starship
eval "$(starship init zsh)"
