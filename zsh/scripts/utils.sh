alias tt="bash $XDG_CONFIG_HOME/kitty/theme_switcher.sh"

# change the current working directory when exiting Yazi.
# q: exit and chdir, Q: exit without chdir
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd" || exit
  fi
  rm -f -- "$tmp"
}

# functin tm() {
#   if command -v tmux &>/dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#     exec tmux new-session -A -s main
#   fi
# }

m4a_to_mp3() {
  for file in *.m4a; do
    [ -f "$file" ] || continue # Skip if no .m4a files found
    output="${file%.m4a}.mp3"
    echo "Converting: $file -> $output"
    ffmpeg -i "$file" -b:a 192k "$output"
  done
}

# Extract MP3 from all MP4 files in current directory
mp4_to_mp3() {
  for file in *.mp4; do
    [ -f "$file" ] || continue # Skip if no .mp4 files found
    output="${file%.mp4}.mp3"
    echo "Extracting audio: $file -> $output"
    ffmpeg -i "$file" -vn -acodec mp3 "$output"
  done
}
# Speed up audio
speedup_audio() {
  local speed=${3:-1.5}
  ffmpeg -i "$1" -filter:a "atempo=$speed" "$2"
}

# Convert all WebM files to MP4 in current directory
webm_to_mp4() {
  for file in *.webm; do
    [ -f "$file" ] || continue # Skip if no .webm files found
    output="${file%.webm}.mp4"
    echo "Converting: $file -> $output"
    ffmpeg -i "$file" -c:v libx264 -c:a aac "$output"
  done
}
