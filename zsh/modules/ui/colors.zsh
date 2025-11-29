#!/usr/bin/env zsh
# ================================================
# COLOR CONFIGURATION
# ================================================

# Enable colors
autoload -U colors && colors

# LS colors
if command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b)"
fi

# Custom LS_COLORS (if you want to customize)
# export LS_COLORS="di=1;34:ln=1;36:so=1;35:pi=40;33:ex=1;32:bd=40;33;01:cd=40;33;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:*.tar=1;31:"

# Completion colors
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
