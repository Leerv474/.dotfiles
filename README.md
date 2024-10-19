# Personal dotfiles for system configuretion

## apps
- hyprland (hyprpaper, hypridle, hyprlock)
- firefox (userChrome.css, userContext.css)
- ideavimrc
- zsh
- fastfetch
- btop
- bat
- kitty
- nvim (wl-copy)
- rofi
- waybar
- yazi
- caps2esc
- sddm

## linking

> ! `.dotfiles` directory has to be in the home directory

- keyboard-config -> /etc/interception (hard links)
- sddm: 
    1. main-theme -> /usr/share/sddm/themes (copy)
    2. sddm.conf -> /etc/sddm.conf (copy)
- .ideavimrc -> ~
- bat -> .config/bat
- btop -> .config/btop
- fastfetch -> .config/fastfetch
- hypr -> .config/hypr
- kitty -> .config/kitty
- nvim -> .config/nvim
- rofi -> .config/rofi
- waybar -> .config/waybar
- yazi -> .config/yazi

