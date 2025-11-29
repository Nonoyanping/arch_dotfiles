#!/usr/bin/env zsh
# ================================================
# ZOXIDE (SMART CD)
# ================================================

# Only load if zoxide exists
command -v zoxide >/dev/null 2>&1 || return

# Prevent double-init
[[ -v ZOXIDE_INITED ]] && return
ZOXIDE_INITED=1

# Initialize zoxide
eval "$(zoxide init zsh)"

# Aliases
alias cd='z'
alias cdi='zi'  # Interactive zoxide
