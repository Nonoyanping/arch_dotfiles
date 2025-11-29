#!/usr/bin/env zsh
# ================================================
# ALIASES
# ================================================

# ===== MODERN CLI REPLACEMENTS =====
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons'
  alias ll='eza -lah --icons --git'
  alias la='eza -a --icons'
  alias lt='eza --tree --level=2 --icons'
  alias l='eza -lh --icons'
  alias tree='eza --tree --icons'
else
  alias ls='ls --color=auto'
  alias ll='ls -lah'
  alias la='ls -A'
  alias l='ls -lh'
fi

if command -v bat >/dev/null 2>&1; then
  alias cat='bat --paging=never'
  alias ccat='/usr/bin/cat'  # Original cat
  alias less='bat --paging=always'
fi

if command -v nvim >/dev/null 2>&1; then
  alias vim='nvim'
  alias vi='nvim'
fi

if command -v rg >/dev/null 2>&1; then
  alias grep='rg'
  alias ogrep='/usr/bin/grep'  # Original grep
fi

# ===== SAFETY ALIASES =====
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'

# ===== SYSTEM =====
alias c='clear'
alias h='history'
alias j='jobs'
alias x='exit'

# Process management
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
alias ports='netstat -tulanp'

# Disk usage
alias du='du -h'
alias df='df -h'

# ===== GIT =====
alias g='git'
alias gs='git status'
alias gst='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gl='git log'
alias glo='git log --oneline'
alias gd='git diff'
alias gdc='git diff --cached'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gm='git merge'
alias gr='git remote'
alias gra='git remote add'
alias grv='git remote -v'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gst='git stash'
alias gsta='git stash apply'
alias gstl='git stash list'
alias gstp='git stash pop'

# Lazygit
alias lg='lazygit'

# ===== TMUX =====
alias t='tmux'
alias ta='tmux attach -t'
alias tls='tmux ls'
alias tn='tmux new -s'
alias tk='tmux kill-session -t'
alias td='tmux detach'

# ===== PACKAGE MANAGEMENT =====
alias p='paru'
alias pi='paru -S'
alias pr='paru -R'
alias ps='paru -Ss'
alias pu='paru -Syu'
alias pc='paru -Sc'
# TODO: Want to add paru -Qs

# ===== NAVIGATION =====
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'

# ===== DIRECTORIES =====
alias dl='cd ~/Downloads'
alias docs='cd ~/Documents'
alias dt='cd ~/dotfiles'
alias proj='cd ~/projects'

# ===== YAZI =====
if command -v yazi >/dev/null 2>&1; then
  alias y='yazi'
  alias fm='yazi'
fi

# ===== LAZYDOCKER =====
if command -v lazydocker >/dev/null 2>&1; then
  alias lzd='lazydocker'
fi

# ===== DOCKER =====
if command -v docker >/dev/null 2>&1; then
  alias d='docker'
  alias dc='docker-compose'
  alias dps='docker ps'
  alias dpsa='docker ps -a'
  alias di='docker images'
  alias dex='docker exec -it'
  alias dlog='docker logs -f'
fi

# ===== KUBERNETES =====
if command -v kubectl >/dev/null 2>&1; then
  alias k='kubectl'
  alias kg='kubectl get'
  alias kd='kubectl describe'
  alias kdel='kubectl delete'
  alias kl='kubectl logs'
  alias kex='kubectl exec -it'
fi

# ===== MISC =====
# TODO: Need to chage to real path
# alias reload='source ~/.zshrc'
# alias zshrc='$EDITOR ~/.zshrc'
# alias aliases='$EDITOR ~/dotfiles/zsh/modules/utils/aliases.zsh'

# Weather
alias weather='curl wttr.in'

# IP addresses
alias myip='curl ifconfig.me'
alias localip='ip addr show | grep "inet " | grep -v 127.0.0.1'

# Copy to clipboard
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'


# ===== Custom Alias =====
alias ctags='\ctags'
alias sv="sudo -E nvim"
# alias v="nvim $(fzf)"
# alias doc="bat $(fzf)"
# alias vro='nvim -R -u ~/.config/nvim/readonly.lua'
