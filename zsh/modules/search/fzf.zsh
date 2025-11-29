#!/usr/bin/env zsh
# ================================================
# FZF CONFIGURATION
# ================================================

command -v fzf >/dev/null 2>&1 || return

# ===== FZF OPTIONS =====
export FZF_DEFAULT_OPTS="
  --height 40%
  --layout=reverse
  --border
  --inline-info
  --ansi
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-u:half-page-up'
  --bind 'ctrl-d:half-page-down'
  --bind 'ctrl-a:toggle-all'
  --bind 'ctrl-y:execute-silent(echo {+} | xclip -selection clipboard)'
  --preview-window 'right:50%:wrap'
"

# ===== FZF COMMANDS =====
# Use fd if available
if command -v fd >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
fi

# ===== SOURCE FZF KEYBINDINGS =====
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
fi

if [[ -f /usr/share/fzf/completion.zsh ]]; then
  source /usr/share/fzf/completion.zsh
fi

# Alternative: if you have fzf installed via other means
[[ -f "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"
[[ -f "$XDG_CONFIG_HOME/zsh/.fzf.zsh" ]] && source "$XDG_CONFIG_HOME/zsh/.fzf.zsh"

# ===== CUSTOM FZF FUNCTIONS =====

# fzf git branches
fzf-git-branch() {
  local branch
  branch=$(git branch -a | grep -v HEAD | fzf --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -50' | sed 's/^..//' | cut -d' ' -f1)
  [[ -n $branch ]] && git checkout "$branch"
}

# fzf kill process
fzf-kill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m --preview 'echo {}' --preview-window down:3:wrap | awk '{print $2}')
  [[ -n $pid ]] && kill -9 "$pid"
}

# fzf cd to directory
fzf-cd() {
  local dir
  dir=$(fd --type d --hidden --follow --exclude .git | fzf --preview 'eza --tree --level=2 --color=always {}')
  [[ -n $dir ]] && cd "$dir"
}

# Aliases
alias gb='fzf-git-branch'
alias fk='fzf-kill'
alias fc='fzf-cd'

# ===== FZF WIDGET FOR CTRL-R =====
# Make sure Ctrl-R uses fzf for history
bindkey '^R' fzf-history-widget
