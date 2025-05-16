#!/bin/bash
DEVICE=$1

print_text() {
  echo -e "\n\e[1;33m$1\e[0m"
}

current_dir() {
  dirname -- "$0"
}

# install Pulsar
print_text "Installing pulsar-edit"

# install docker
print_text "Installing Docker"

# install virt-manager
print_text "Installing virt-manger"
sudo apt install virt-manager bridge-utils -y
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER
sudo virsh net-autostart default

print_text "DONE"
