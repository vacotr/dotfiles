# LMDE setup
https://www.linuxmint.com/download_lmde.php

## Post-install
Run tasks.

## Manual steps
- Follow welcome screen recommendations
- Setup languages with mintlocale

## Apps
### External
- VSCodium ([repo](https://vscodium.com/#install-on-debian-ubuntu-deb-package))
- OnlyOffice ([repo](https://helpcenter.onlyoffice.com/installation/desktop-install-ubuntu.aspx))

### Tweaks
#### Firefox
- Enable HW acceleration: set `media.ffmpeg.vaapi.enabled` in `about:config` to `true`
- Disable Pocket extension: set `extensions.pocket.enabled` in `about:config` to `false`
- Enable swipe gestures: add `export MOZ_USE_XINPUT2=1` to `~/.profile`
- Addons: uBlock Origin, Bitwarden

## Cinnamon
### Applets
- Lock keys indicator with notifications
- Automatic dark/light themes

### Desklets

