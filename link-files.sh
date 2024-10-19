#!/bin/sh

if [ ! -d "$HOME/.dotfiles" ]; then
  echo ".dotfiles directory does not exist. Exiting."
  exit 1
fi

if [ "$EUID" -ne 0 ]; then
  echo "To link everything properly run with sudo"
  exit
fi

if [ -d "/usr/share/sddm/themes" ]; then
    cp -r ~/.dotfiles/sddm/main /usr/share/sddm/themes/main
fi
ln -s ~/.dotfiles/sddm/sddm.conf /etc/sddm.conf

ln -s ~/.dotfiles/.ideavimrc ~/.ideavimrc

mkdir ~/Pictures
ln -s ~/.dotfiles/wallpapers ~/Pictures/wallpapers

ln -s ~/.dotfiles/.tmux ~/.tmux
ln -s ~/.dotfiles/.tmux/.tmux.conf ~/.tmux/.tmux.conf

if [ -d "/etc/interception/udevmon.d" ]; then
    ln ~/.dotfiles/keyboard-config/touchpad.yaml /etc/interception/touchpad.yaml
    ln ~/.dotfiles/keyboard-config/laptop_keyboard.yaml /etc/interception/laptop_keyboard.yaml
    ln ~/.dotfiles/keyboard-config/udevmon.d/laptop.yaml /etc/interception/udevmon.d/laptop.yaml
    ln ~/.dotfiles/keyboard-config/udevmon.d/default.yaml /etc/interception/udevmon.d/default.yaml
else

mkdir ~/.config

ln -s ~/.dotfiles/.config/bat ~/.config/bat
ln -s ~/.dotfiles/.config/btop ~/.config/btop
ln -s ~/.dotfiles/.config/fastfetch ~/.config/fastfetch
ln -s ~/.dotfiles/.config/hypr ~/.config/hypr
ln -s ~/.dotfiles/.config/kitty ~/.config/kitty
ln -s ~/.dotfiles/.config/nvim ~/.config/nvim
ln -s ~/.dotfiles/.config/rofi ~/.config/rofi
ln -s ~/.dotfiles/.config/waybar ~/.config/waybar
ln -s ~/.dotfiles/.config/yazi ~/.config/yazi

echo "put firefox config and setup gtk theme by hand"
