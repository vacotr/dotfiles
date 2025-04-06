#!/bin/bash
print_text() {
	echo -e "\n\e[1;33m$1\e[0m"
}

sudo apt update

print_text "Upgrading kernel, mesa and firmware from backports"
sudo apt install -t bookworm-backports linux-image-amd64
sudo apt install -t bookworm-backports mesa-vulkan-drivers
sudo apt install -t bookworm-backports firmware-linux

print_text "Installing packages"
sudo apt install mpv alacritty chromium gimp power-profiles-daemon mint-backgrounds-wallpapers git tree

print_text "Removing packages"
sudo apt remove pix hexchat gnome-calendar libreoffice-common rhythmbox hypnotix celluloid gnome-terminal drawing

print_text "Cleaning extra packages"
sudo apt autoremove

print_text "Copying config files: amdgpu, gitconfig, alacritty"
# amdgpu
sudo cp $(dirname -- "$0")/../config-files/etc/X11/xorg.conf.d/20-amdgpu.$(hostname).conf /etc/X11/xorg.conf.d/20-amdgpu.conf
# gitconfig
cp $(dirname -- "$0")/../config-files/.gitconfig ~/
# alacritty
mkdir -p ~/.config/alacritty
cp $(dirname -- "$0")/../config-files/.config/alacritty/alacritty.yml ~/.config/alacritty/

print_text "DONE"
