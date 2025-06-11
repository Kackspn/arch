#!/bin/sh


curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

sudo mkdir -p /opt/nvim
sudo mv nvim.appimage /opt/nvim/nvim

sudo apt install wget zsh npm xclip luarocks clangd pip cargo ripgrep cmake -y

git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
sudo mv zsh-syntax-highlighting /usr/share/zsh
sudo mv zsh-autosuggestions /usr/share/zsh
cp .zshrc ~
ln ~/.zshrc ~/.config/nvim/.zshrc

cd ~
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip
unzip Hack.zip
mkdir HackNerdFont && mv HackNerdFont-BoldItalic.ttf HackNerdFont-Bold.ttf HackNerdFont-Italic.ttf HackNerdFont-Regular.ttf HackNerdFont/ && sudo mv HackNerdFont /usr/share/fonts/ 
rm Nerd* Hack.zip LICENSE.md README.md

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
# Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in
# your system-wide PATH)
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
# Update the paths to the kitty and its icon in the kitty desktop file(s)
sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
# Make xdg-terminal-exec (and hence desktop environments that support it use kitty)
echo 'kitty.desktop' > ~/.config/xdg-terminals.list
rm ~/.config/kitty/kitty.config
cp ~/nvim/colors.conf ~/.config/kitty 
cp ~/nvim/kitty.conf ~/.config/kitty
cp ~/nvim/.p10k.zsh ~/.p10k.zsh

sudo fc-cache -f -v

chsh -s $(which zsh)
cd ~
source ~/.zshrc
source ~/.p10k.zsh
sudo mv nvim .config

