#!/bin/bash
print_text() {
        echo -e "\n\e[1;33m$1\e[0m"
}

#print_text "Installing Steam"
#sudo dpkg --add-architecture i386
#sudo apt update
#sudo apt install steam-installer
#sudo apt install mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386

print_text "Installing Discord"
bash $(dirname -- "$0")/../scripts/update-discord.sh

print_text "Installing: gamemode, mangohud"
sudo apt install gamemode
sudo apt install mangohud mangohud:i386

print_text "Copying config files: discord, mangohud"
# discord
mkdir -p ~/.config/autostart ~/.local/bin
cp $(dirname -- "$0")/../config-files/.config/autostart/discord-stable.desktop ~/.config/autostart/
cp $(dirname -- "$0")/../scripts/update-discord.sh ~/.local/bin/
# MangoHud
mkdir -p ~/.config/MangoHud
cp $(dirname -- "$0")/../config-files/.config/MangoHud/MangoHud.conf ~/.config/MangoHud/

print_text "DONE"
