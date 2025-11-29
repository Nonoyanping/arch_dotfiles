# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ..="cd .."
alias ...="cd ../.."

# alias hx="helix"

alias zconf="cd $XDG_CONFIG_HOME/zsh && nvim ./.zshrc"
alias bconf="hx $HOME/.bashrc"

alias alaconf="cd $XDG_CONFIG_HOME/alacritty/ && nvim./alacritty.toml"
alias kconf="cd $XDG_CONFIG_HOME/kitty/ && nvim ./kitty.conf"
alias gconf="cd $XDG_CONFIG_HOME/ghostty/ && nvim ./config"
alias tconf="cd $XDG_CONFIG_HOME/tmux/ && nvim ./tmux.conf"
alias nconf="cd $XDG_CONFIG_HOME/nvim/ && nvim ./init.lua"
alias niconf="cd $XDG_CONFIG_HOME/niri/ && nvim ./config.kdl"

# TODO: Optimize workflow with fzf
# alias pj="cd $HOME/404/projects"

alias path='echo "$PATH" | tr ":" "\\n" | nl'
alias ff="fastfetch"
alias ibusr="ibus restart"
alias l='eza -al --icons'
alias lt='eza -T --icons'
# alias t="tree"
alias lg="lazygit"
alias ldc="lazydocker"
alias h="tldr"
alias sunvim="sudo -E nvim"

alias virsh="virsh -c qemu:///system"
alias see="kitten icat"
alias br="sudo systemctl restart bluetooth.service"

# alias sleep=""
alias q="paru -Ss"
alias i="paru -S --needed"
alias f="paru -Qs | fzf"
