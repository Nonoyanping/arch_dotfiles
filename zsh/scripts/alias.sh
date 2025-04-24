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

alias hx="helix"

alias zconf="nvim $XDG_CONFIG_HOME/zsh/.zshrc"
alias bconf="hx $HOME/.bashrc"
alias alaconf="nvim $XDG_CONFIG_HOME/alacritty/alacritty.toml"

alias path='echo "$PATH" | tr ":" "\\n" | nl'
alias ff="fastfetch"
alias ibusr="ibus restart"

alias l="eza -al"
alias t="tree"
alias lg="lazygit"
alias h="tldr"
