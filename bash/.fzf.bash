# Setup fzf
# ---------
if [[ ! "$PATH" == */home/yanping/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/yanping/.fzf/bin"
fi

eval "$(fzf --bash)"
