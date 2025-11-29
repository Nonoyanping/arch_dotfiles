nerd_fonts=(
ttf-meslo-nerd
ttf-hack-nerd
ttf-jetbrains-mono-nerd
ttf-firacode-nerd
ttf-dejavu-nerd
ttf-cascadia-mono-nerd
ttf-cascadia-code-nerd
ttf-roboto-mono-nerd
ttf-sourcecodepro-nerd
ttf-victor-mono-nerd
)


for fonts in "${nerd_fonts[@]}"; do
	yay -S --noconfirm "$fonts"
done

