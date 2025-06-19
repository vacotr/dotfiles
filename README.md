# LMDE setup
https://www.linuxmint.com/download_lmde.php

## Post-install
1. Update system
2. Follow welcome screen recommendations
3. Setup languages with mintlocale
4. Run `make`

## Apps
### Tweaks
#### Firefox
- use [Betterfox](https://github.com/yokoffing/Betterfox)
  ```
  user_pref("privacy.userContext.enabled", true);
  user_pref("media.hardware-video-decoding.force-enabled", true);
  user_pref("browser.search.separatePrivateDefault", false);
  user_pref("browser.translations.automaticallyPopup", false);
  user_pref("widget.gtk.overlay-scrollbars.enabled", false);
  user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
  user_pref("browser.newtabpage.activity-stream.showSearch", false);
  ```
- Enable swipe gestures: add `export MOZ_USE_XINPUT2=1` to `~/.profile`
- Addons
  - [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)
    - setup [recommended filters](https://github.com/yokoffing/filterlists#guidelines)
  - [Bitwarden Password Manager](https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/)
  - [Firefox Multi-Account Containers](https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/)

#### Discord
- start minimized: `Exec=/usr/share/discord/Discord --start-minimized`

#### Steam
- fix GUI not showing: copy desktop file to `.local/share/applications` and comment out 2 lines
  ```
  PrefersNonDefaultGPU
  X-KDE-RunOnDiscreteGpu
  ```
- start minimized: `Exec=/usr/bin/steam -silent %U`
- launch options:
  - `gamescope -W 3440 -H 1440 -r 160 -f -- %command%`
  - `gamescope -W 1920 -H 1080 -r 60 -f -- %command%`

#### Figma
  - set as webapp with webapp manager
  - for local fonts use: https://github.com/neetly/figma-agent-linux
    - custom parametr: `--user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.3"`

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
