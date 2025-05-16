alias tt="bash $XDG_CONFIG_HOME/kitty/theme_switcher.sh"

# change the current working directory when exiting Yazi.
# q: exit and chdir, Q: exit without chdir
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
