nav_pj() {
  # Simple project navigator for ~/404
  PROJECTS_DIR="$HOME/404"

  find "$PROJECTS_DIR" -mindepth 1 -maxdepth 3 -type d |
    sed "s|$PROJECTS_DIR/||" |
    fzf --prompt="Project: " \
      --height=60% --border \
      --preview "
            if [ -f $PROJECTS_DIR/{}/README.md ]; then
                bat --style=plain --color=always $PROJECTS_DIR/{}/README.md
            elif [ -f $PROJECTS_DIR/{}/README.txt ]; then
                bat --style=plain --color=always $PROJECTS_DIR/{}/README.txt
            elif [ -f $PROJECTS_DIR/{}/README ]; then
                bat --style=plain --color=always $PROJECTS_DIR/{}/README
            else
                ls -la $PROJECTS_DIR/{}
            fi" \
      --preview-window=right:50% |
    {
      read -r selected
      [[ -n "$selected" ]] && echo "cd '$PROJECTS_DIR/$selected'"
    }
}

alias pj='eval "$(nav_pj)"'
