#!/usr/bin/env bash

##############################
#    Remove Ibus(Optional)   #
##############################
# yay -Rns ibus ibus-mozc ibus-libpinyin

##############################
#       Install fcitx5       #
##############################
yay -S --needed fcitx5-im fcitx5-mozc fcitx5-pinyin-zhwiki fcitx5-chinese-addons fcitx5-configtool

yay -S \
  catppuccin-fcitx5-git \
  fcitx5-nord \
  fcitx5-breeze \
  fcitx5-material-color \
  fcitx5-polaris

mkdir -p ~/.config/environment.d
cat > ~/.config/environment.d/fcitx5.conf <<EOF
GTK_IM_MODULE="fcitx5"
QT_IM_MODULE="fcitx5"
XMODIFIERS='@im=fcitx5'

EOF

