#!/bin/bash
DEVICE=$1

print_text() {
  echo -e "\n\e[1;33m$1\e[0m"
}

current_dir() {
  dirname -- "$0"
}

sudo apt update

# install base repo packages
print_text "Installing packages"
sudo apt install mpv alacritty chromium gimp power-profiles-daemon mint-backgrounds-wallpapers git tree extrepo -y
# install onlyoffice
sudo extrepo enable onlyoffice-desktopeditors
sudo apt update
sudo apt install onlyoffice-desktopeditors

# install fonts
print_text "Installing fonts"
sudo mkdir -p /usr/local/share/fonts
sudo cp -r $(current_dir)/../config-files/usr/local/share/fonts/* /usr/local/share/fonts/
fc-cache -f

# remove unwanted packages
print_text "Removing packages"
sudo apt remove pix hexchat gnome-calendar libreoffice-common rhythmbox hypnotix celluloid gnome-terminal drawing gdebi -y

print_text "Cleaning extra packages"
sudo apt autoremove

# copy config files
print_text "Copying config files: amdgpu, gitconfig, alacritty"
# amdgpu
sudo cp $(current_dir)/../config-files/etc/drirc /etc/
sudo cp $(current_dir)/../config-files/etc/X11/xorg.conf.d/20-amdgpu."$DEVICE".conf /etc/X11/xorg.conf.d/20-amdgpu.conf
# gitconfig
cp $(current_dir)/../config-files/.gitconfig ~/
# alacritty
mkdir -p ~/.config/alacritty
cp $(current_dir)/../config-files/.config/alacritty/alacritty.yml ~/.config/alacritty/
# onlyoffice
mkdir -p ~/.config/onlyoffice
cp $(current_dir)/../config-files/.config/onlyoffice/DesktopEditors.conf ~/.config/onlyoffice/

print_text "DONE"
