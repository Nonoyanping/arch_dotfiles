#!/usr/bin/env zsh
# ================================================
# UTILITY FUNCTIONS
# ================================================

# ===== FILE OPERATIONS =====

# Extract various archive formats
extract() {
  if [[ ! -f "$1" ]]; then
    echo "Error: '$1' is not a valid file"
    return 1
  fi

  case "$1" in
    *.tar.bz2)  tar xjf "$1"      ;;
    *.tar.gz)   tar xzf "$1"      ;;
    *.tar.xz)   tar xJf "$1"      ;;
    *.bz2)      bunzip2 "$1"      ;;
    *.rar)      unrar x "$1"      ;;
    *.gz)       gunzip "$1"       ;;
    *.tar)      tar xf "$1"       ;;
    *.tbz2)     tar xjf "$1"      ;;
    *.tgz)      tar xzf "$1"      ;;
    *.zip)      unzip "$1"        ;;
    *.Z)        uncompress "$1"   ;;
    *.7z)       7z x "$1"         ;;
    *.deb)      ar x "$1"         ;;
    *.tar.zst)  tar --zstd -xf "$1" ;;
    *)
      echo "Error: '$1' cannot be extracted via extract()"
      return 1
      ;;
  esac
}

# Create archive
compress() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: compress <file/directory> [output.tar.gz]"
    return 1
  fi
  
  local output="${2:-${1%/}.tar.gz}"
  tar czf "$output" "$1"
  echo "Created: $output"
}

# ===== SEARCH =====

# Quick find
qf() {
  find . -iname "*$1*"
}

# Quick grep
qg() {
  grep -r "$1" .
}

# Find and replace in files
far() {
  if [[ $# -lt 2 ]]; then
    echo "Usage: far <find> <replace> [file_pattern]"
    return 1
  fi
  
  local find="$1"
  local replace="$2"
  local pattern="${3:-*}"
  
  find . -type f -name "$pattern" -exec sed -i "s/$find/$replace/g" {} +
}

# ===== DIRECTORY OPERATIONS =====

# Create directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Create temporary directory and cd into it
mktmp() {
  local tmpdir=$(mktemp -d)
  cd "$tmpdir"
  echo "Created temporary directory: $tmpdir"
}

# Backup file with timestamp
backup() {
  local file="$1"
  if [[ ! -f "$file" ]]; then
    echo "Error: File not found: $file"
    return 1
  fi
  
  local backup="${file}.backup-$(date +%Y%m%d-%H%M%S)"
  cp "$file" "$backup"
  echo "Backed up: $file → $backup"
}

# ===== PROCESS MANAGEMENT =====

# Kill process by name
killname() {
  if [[ -z "$1" ]]; then
    echo "Usage: killname <process_name>"
    return 1
  fi
  
  ps aux | grep -i "$1" | grep -v grep | awk '{print $2}' | xargs kill -9
}

# ===== NETWORK =====

# Simple HTTP server
serve() {
  local port="${1:-8000}"
  python -m http.server "$port"
}

# Test website response time
speedtest() {
  local url="${1:-https://google.com}"
  curl -o /dev/null -s -w "Time: %{time_total}s\n" "$url"
}

# ===== GIT =====

# Git commit with timestamp
gcn() {
  local msg="${1:-Update}"
  git commit -m "$msg - $(date +%Y-%m-%d\ %H:%M:%S)"
}

# Git quick commit and push
gcp() {
  local msg="${1:-Update}"
  git add .
  git commit -m "$msg"
  git push
}

# Git undo last commit (keep changes)
gundo() {
  git reset --soft HEAD~1
}

# Clone and cd into repository
gcl() {
  git clone "$1" && cd "$(basename "$1" .git)"
}

# ===== SYSTEM INFO =====

# System information
sysinfo() {
  echo "=== System Information ==="
  echo "Hostname:    $(hostname)"
  echo "Kernel:      $(uname -r)"
  echo "Uptime:      $(uptime -p)"
  echo "Shell:       $SHELL"
  echo "Terminal:    $TERM"
  echo "CPU:         $(lscpu | grep 'Model name' | cut -d: -f2 | xargs)"
  echo "Memory:      $(free -h | awk '/^Mem:/ {print $3 "/" $2}')"
  echo "Disk:        $(df -h / | awk '/\// {print $3 "/" $2}')"
}

# ===== TMUX =====

# Create or attach to tmux session
tat() {
  local session="${1:-$(basename $(pwd))}"
  
  if tmux has-session -t "$session" 2>/dev/null; then
    tmux attach -t "$session"
  else
    tmux new -s "$session"
  fi
}

# ===== MISC =====

# Fancy Ctrl-Z (toggle foreground/background)
fancy-ctrl-z() {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Make file executable
mx() {
  chmod +x "$1"
  echo "Made executable: $1"
}

# Generate random password
genpass() {
  local length="${1:-16}"
  openssl rand -base64 "$length" | tr -d "=+/" | cut -c1-"$length"
}

# Show file size in human readable format
size() {
  du -sh "$1"
}

# Count files in directory
count() {
  find "${1:-.}" -type f | wc -l
}
