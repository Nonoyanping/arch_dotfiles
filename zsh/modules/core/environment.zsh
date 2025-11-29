#!/usr/bin/env zsh
# ================================================
# ENVIRONMENT VARIABLES
# ================================================

# ===== EDITOR =====
export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"

# ===== TERMINAL =====
export TERM=xterm-kitty
export COLORTERM=truecolor

# ===== PAGER =====
export PAGER="less"
export LESS="-R -F -X -i -M"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

# ===== MAN PAGES =====
export MANPAGER="nvim +Man!"
export MANWIDTH=999

# ===== LANGUAGE =====
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# ===== VI MODE =====
export KEYTIMEOUT=10  # Reduce ESC delay to 10ms

# ===== LESS COLORS =====
export LESS_TERMCAP_mb=$'\e[1;32m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;32m'     # begin blink
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\e[01;33m'    # begin reverse video
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\e[1;4;31m'   # begin underline
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline

# ===== DIRECTORIES =====
# Create essential directories
[[ ! -d "$XDG_CACHE_HOME/less" ]] && mkdir -p "$XDG_CACHE_HOME/less"
[[ ! -d "$XDG_DATA_HOME/zsh" ]] && mkdir -p "$XDG_DATA_HOME/zsh"
[[ ! -d "$XDG_CACHE_HOME/zsh" ]] && mkdir -p "$XDG_CACHE_HOME/zsh"

# ===== Custom Defines =====
export CALYPSO_MD_ROOT="$HOME/404/projects/CalNav/data/md"
export CALYPSO_DOCS_MD="$HOME/Documents/APIs/JavadocMD/"
export CALYPSO_INDEX_DB="$HOME/404/projects/CalNav/data/index.db"
# export PATH="$HOME/.local/bin:$PATH"
