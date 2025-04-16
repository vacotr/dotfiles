#!/bin/bash
STEAM_URL="https://cdn.fastly.steamstatic.com/client/installer/steam.deb"

print_text() {
        echo -e "\n\e[1;33m$1\e[0m"
}

print_text "Installing Steam"
sudo dpkg --add-architecture i386
sudo apt update
curl -L -o ~/Downloads/steam.deb $STEAM_URL
captain ~/Downloads/steam.deb
rm ~/Downloads/steam.deb

print_text "Installing Discord"
bash $(dirname -- "$0")/../scripts/update-discord.sh

print_text "Installing: gamemode, mangohud"
sudo apt install gamemode mangohud mangohud:i386 -y

print_text "Copying config files: discord, mangohud"
# discord
mkdir -p ~/.config/autostart ~/.local/bin
cp $(dirname -- "$0")/../config-files/.local/share/applications/steam.desktop ~/.local/share/applications/
cp $(dirname -- "$0")/../config-files/.config/autostart/steam.desktop ~/.config/autostart/
cp $(dirname -- "$0")/../config-files/.config/autostart/discord-stable.desktop ~/.config/autostart/
cp $(dirname -- "$0")/../scripts/update-discord.sh ~/.local/bin/
# MangoHud
mkdir -p ~/.config/MangoHud
cp $(dirname -- "$0")/../config-files/.config/MangoHud/MangoHud.conf ~/.config/MangoHud/

print_text "DONE"
