#!/usr/bin/env zsh
# ================================================
# DIRECTORY NAVIGATION
# ================================================

# ===== DIRECTORY ALIASES =====
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

alias -- -='cd -'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'

# ===== DIRECTORY LISTING =====
# Show directory stack
alias d='dirs -v'

# Quick directory jumps
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ===== FUNCTIONS =====
# cd and ls
cdls() {
  cd "$1" && ls
}

# mkdir and cd
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# cd to project root (find git root)
cdroot() {
  local root
  root=$(git rev-parse --show-toplevel 2>/dev/null)
  if [[ -n $root ]]; then
    cd "$root"
  else
    echo "Not in a git repository"
    return 1
  fi
}
