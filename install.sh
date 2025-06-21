#!/bin/sh

while :
do
  echo "Which WM would you like?"
  echo "1. i3"
  echo "2. Hyprland"
  read -pr "Selection (1, 2): " input

  if ["$input" == "1"]; then
    echo "Installing i3"
    echo "-------------------------------------------------------------------------"
    sudo pacman -S --needed i3 feh maim xclip cargo xorg kitty polybar mpd dunst steam nemo lutris rofi ly polkit zsh rustup npm mangohud os-prober unzip ffmpeg ccache llvm
    rustup update stable
    cargo install --git https://github.com/mierak/rmpc --locked
    mkdir ~/.config
    mv ./mpd ./i3 ./dunst/ ./rmpc ./kitty ./polybar ./nvim ./rofi ./pipewire ./backlight ~/.config
    mv .zshrc ~
    git clone https://aur.archlinux.org/yay.git\
    cd yay\
    makepkg -si


    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip
    unzip Hack.zip
    mkdir Nerds
    mv HackNerdFont-BoldItalic.ttf HackNerdFont-Bold.ttf HackNerdFont-Italic.ttf HackNerdFont-Regular.ttf Nerds
    sudo mv Nerds /usr/share/fonts
    fc-cache -f -v


    break
  fi
  if ["$input" == "2"]; then
    echo "Installing Hyprland"
    echo "-------------------------------------------------------------------------"
    sudo pacman -S --needed hyprland hyperpaper hyprshot wl-clipboard cargo kitty waybar mpd dunst steam nemo lutris wofi ly polkit zsh rustup npm mangohud os-prober unzip ffmpeg ccache llvm xorg-wayland wayland-protocols
    rustup update stable
    cargo install --git https://github.com/mierak/rmpc --locked
    mkdir ~/.config
    mv ./mpd ./hypr ./dunst/ ./rmpc ./kitty ./waybar ./nvim ./wofi ./pipewire ./backlight ~/.config
    mv .zshrc ~
    git clone https://aur.archlinux.org/yay.git\
    cd yay\
    makepkg -si


    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip
    unzip Hack.zip
    mkdir Nerds
    mv HackNerdFont-BoldItalic.ttf HackNerdFont-Bold.ttf HackNerdFont-Italic.ttf HackNerdFont-Regular.ttf Nerds
    sudo mv Nerds /usr/share/fonts
    fc-cache -f -v


    break
  fi

done

