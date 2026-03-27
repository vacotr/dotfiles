# LMDE setup
https://www.linuxmint.com/download_lmde.php

## Post-install
1. Update system
2. Follow welcome screen recommendations
3. Setup languages with mintlocale
4. Run `just`

## Apps
**general**
- firefox
- chromium
- spotify (flatpak)
- vicinae (script)
- alacritty
- onlyoffice (repo / deb)
- thunderbird
- transmission
- mpv
- gimp

**dev**
- vscodium (repo / deb)
- docker
- virt-manager

**work**
- slack (flatpak)

**gaming**
- steam (deb)
- discord (flatpak)

**???**
- bitwarden


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
  - `mangohud gamemoderun %command%`