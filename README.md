# LMDE setup
https://www.linuxmint.com/download_lmde.php

## Post-install
1. `sudo apt update && sudo apt upgrade -y`
2. Follow welcome screen recommendations
3. Setup languages with mintlocale
4. Run tasks:
    - post-install
    - cinnamon-setup
    - gaming-setup

## Apps
### External
- Pulsar ([deb](https://pulsar-edit.dev/download.html#regular-releases))
- OnlyOffice ([deb](https://www.onlyoffice.com/download-desktop.aspx#download-desktop-header-linux))

### Tweaks
#### Firefox
- Enable HW acceleration: set `media.hardware-video-decoding.force-enabled` in `about:config` to `true`
- Disable Pocket extension: set `extensions.pocket.enabled` in `about:config` to `false`
- Enable swipe gestures: add `export MOZ_USE_XINPUT2=1` to `~/.profile`
- Addons: uBlock Origin, Bitwarden

#### OnlyOffice
- Change settings: name, scaling, theme

## Cinnamon
### Applets
- Lock keys indicator with notifications
- Automatic dark/light themes

### Desklets
