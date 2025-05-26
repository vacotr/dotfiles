# LMDE setup
https://www.linuxmint.com/download_lmde.php

## Post-install
1. `sudo apt update && sudo apt upgrade -y`
2. Follow welcome screen recommendations
3. Setup languages with mintlocale
4. Run `make`

## Apps
### Tweaks
#### Firefox
- Enable HW acceleration: set `media.hardware-video-decoding.force-enabled` in `about:config` to `true`
- Disable Pocket extension: set `extensions.pocket.enabled` in `about:config` to `false`
- Enable swipe gestures: add `export MOZ_USE_XINPUT2=1` to `~/.profile`
- Addons: uBlock Origin, Bitwarden

#### Discord
- start minimized: `Exec=/usr/share/discord/Discord --start-minimized`

#### Steam
- fix GUI not showing:
  - copy desktop file to `.local/share/applications`
  - comment out 2 lines
    - `PrefersNonDefaultGPU`
    - `X-KDE-RunOnDiscreteGpu`
- start minimized: `Exec=/usr/bin/steam -silent %U`
- launch options:
  - `gamescope -W 3440 -H 1440 -r 160 -f -- %command%`
  - `gamescope -W 1920 -H 1080 -r 60 -f -- %command%`

## Cinnamon
### Applets
- Lock keys indicator with notifications
- Automatic dark/light themes
- Weather

#### Menu
- Panel > Appearance > Use a custom icon and label: false
- Panel > Behavior > Use menu animations: true
- Menu > Layout and content > Show category icons: false
- Menu > Layout and content > Application icon size (px): 24
- Menu > Layout and content > Show favorites and session buttons: false

#### Grouped window list
- General > Show windows from all workspaces: true

#### Calendar
- Display > Use a custom date format: true
- Display > Date format: %H:%M

#### Sound
- Menu > Control Players: false
- Menu > Always show input switch: true
- Panel > Hide system tray icons for compatible players: false

### Desklets
