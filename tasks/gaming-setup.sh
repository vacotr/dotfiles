#!/bin/bash
DEVICE=$1

print_text() {
  echo -e "\n\e[1;33m$1\e[0m"
}

current_dir() {
  dirname -- "$0"
}

print_text "Installing Steam"
sudo dpkg --add-architecture i386
sudo extrepo enable steam
sudo apt update
sudo apt install steam

print_text "Installing Discord"
bash $(current_dir)/../scripts/install-discord.sh

print_text "Installing: gamescope"
sudo apt install gamescope -y

print_text "Copying config files: discord, steam"
mkdir -p ~/.config/autostart ~/.local/bin
# steam
cp $(current_dir)/../config-files/.local/share/applications/steam.desktop ~/.local/share/applications/
cp $(current_dir)/../config-files/.config/autostart/steam.desktop ~/.config/autostart/
# discord
cp $(current_dir)/../config-files/.config/autostart/discord-stable.desktop ~/.config/autostart/
cp $(current_dir)/../scripts/install-discord.sh ~/.local/bin/update-discord.sh

print_text "DONE"
