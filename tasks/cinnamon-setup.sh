#!/bin/bash
print_text() {
        echo -e "\n\e[1;33m$1\e[0m"
}

print_text "Installing fonts"
sudo mkdir -p /usr/share/fonts/custom
sudo cp -r $(dirname -- "$0")/../config-files/usr/share/fonts/custom/* /usr/share/fonts/custom
fc-cache -f

print_text "Setting up Cinnamon desktop"
gsettings set org.cinnamon.muffin unredirect-fullscreen-windows true
gsettings set org.cinnamon.desktop.peripherals.touchpad natural-scroll false
gsettings set org.cinnamon.desktop.peripherals.mouse accel-profile 'flat'
gsettings set org.gnome.nm-applet suppress-wireless-networks-available true
gsettings set org.gnome.nm-applet disable-connected-notifications true
gsettings set org.gnome.nm-applet disable-disconnected-notifications true
gsettings set org.cinnamon.desktop.wm.preferences mouse-button-modifier '<Super>'
gsettings set org.cinnamon alttab-switcher-style 'thumbnails'
gsettings set org.cinnamon alttab-minimized-aware false
gsettings set org.cinnamon.settings-daemon.plugins.color night-light-enabled true
gsettings set org.cinnamon.settings-daemon.plugins.color night-light-temperature 'uint32 4500'
gsettings set org.cinnamon.gestures enabled true
gsettings set org.cinnamon.desktop.session idle-delay 'uint32 300'
gsettings set org.cinnamon.desktop.screensaver lock-delay 'uint32 30'
gsettings set org.gnome.libgnomekbd.keyboard layouts "['cz\tqwerty', 'us']"
gsettings set org.cinnamon.desktop.interface keyboard-layout-show-flags false
gsettings set org.cinnamon.desktop.interface keyboard-layout-use-upper true
gsettings set org.cinnamon.desktop.notifications bottom-notifications true
gsettings set org.cinnamon.desktop.interface gtk-overlay-scrollbars false
gsettings set org.cinnamon.muffin placement-mode 'center'
gsettings set com.linuxmint.updates hide-systray true
gsettings set org.cinnamon.desktop.interface font-name 'Atkinson Hyperlegible Next 11'
gsettings set org.gnome.desktop.interface font-name 'Atkinson Hyperlegible Next 11'
gsettings set org.nemo.desktop font 'Atkinson Hyperlegible Next 11'
gsettings set org.gnome.desktop.interface document-font-name 'Atkinson Hyperlegible Next 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Atkinson Hyperlegible Mono 11'
gsettings set org.cinnamon.desktop.wm.preferences titlebar-font 'Atkinson Hyperlegible Next 11'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Atkinson Hyperlegible Next 11'
gsettings set org.cinnamon.desktop.screensaver font-time 'Atkinson Hyperlegible Next 65'
gsettings set org.cinnamon.desktop.screensaver font-date 'Atkinson Hyperlegible Next 25'
gsettings set org.cinnamon.desktop.screensaver font-message 'Atkinson Hyperlegible Next 15'
gsettings set org.cinnamon.desktop.screensaver default-message 'L O C K E D'

if [[ -x "$(command -v alacritty)" ]]; then
	gsettings set org.cinnamon.desktop.default-applications.terminal exec 'alacritty'
fi

#print_text "Setting up Cinnamon panel"
#gsettings set org.cinnamon panels-height "['1:40']"

print_text "DONE"
