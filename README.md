# Gixo's Hyprland Rice on Arch Linux

Here are my configuration files for this rice. This rice relies heavily on [Pywal](https://github.com/dylanaraps/pywal). Colors change as you change your wallpaper!

These dot files are meant for **Nvidia GPUs** with no guarantee, use them at your own risk.

**There's a delayed unmount and poweroff script included in shutdown script, meant for USB hard drives. You might want to delete it by removing `~/.config/rofi/scripts/usb-sleep.sh` in line 60 of `powermenu` file under rofi scripts directory.**

## Credits

A huge portion of these dot files are based on [rchrdwllm's](https://github.com/rchrdwllm/dotfiles) and [JaKooLit's](https://github.com/JaKooLit/Hyprland-Dots) amazing work.

## Features

- Dynamic colors from wallpapers
- Firefox and VS Code are themed according to those dynamic colors
- Black GTK and Kvantum themes
- Customized shortcuts
  - Launch apps `Super + D`
  - Emojis `Super + .`
  - Blank screen `Super + B`
  - Lock screen `Super + L`
  - Toggle floating mode `Super + Space`
  - Toggle grouping `Super + G`
  - Toggle waybar `Super + T`
  - Launch Firefox `Super + W`
  - Open VS Code `Super + C`
  - Resize windows `Super + RMB`
  - For all keybinds press `Super + ?`
- Waybar with custom widgets

## Apps

**Terminal:** Kitty

**Shell:** Zsh

**Browser:** Firefox

**File manager:** Thunar

**Login manager:** ly

**Themes:** Modified Kvantum Carl theme for Qt and Arc-BLACKEST for GTK

**Icons theme:** Papirus Dark

## Screenshots

### Wallpaper Test 1

![](Screenshots/blue1.png)
![](Screenshots/blue2.png)
![](Screenshots/blue3.png)
![](Screenshots/blue4.png)
![](Screenshots/blue5.png)

### Wallpaper Test 2

![](Screenshots/green1.png)
![](Screenshots/green2.png)
![](Screenshots/green3.png)
![](Screenshots/green4.png)
![](Screenshots/green5.png)

### Wallpaper Test 3

![](Screenshots/red1.png)
![](Screenshots/red2.png)
![](Screenshots/red3.png)
![](Screenshots/red4.png)
![](Screenshots/red5.png)

# Installation

If you have trouble installing Hyprland for Nvidia GPUs, you should try using [JaKooLit's script](https://github.com/JaKooLit/Hyprland-v4).

Before using dot files, make sure to at least have the necessary packages installed.

### Necessary packages

**Base packages:**

```
yay -S --needed hyprland-nvidia-git wayland xorg xorg-server xorg-xrdb xorg-xwayland qt5-wayland qt6-wayland grim gvfs gvfs-mtp jq pamixer polkit-gnome pavucontrol pipewire-alsa playerctl slurp swappy swayidle sway-audio-idle-inhibit-git swaylock-effects waybar wget wl-clipboard cliphist curl rofi rofi-emoji xdg-user-dirs libdrm pixman libxkbcommon python python-requests python-pillow python-pywal python-pywalfox libxml2 llvm libpng gegl mtdev swww wlroots inetutils clinfo update-grub xorg-xhost lshw wlsunset speech-dispatcher python-pip inotify-tools mako-git gnome-keyring imagemagick wtype alsa-firmware tumbler swaync xdg-desktop-portal xdg-desktop-portal-hyprland ly xdg-utils yad pacman-contrib python-pipx hyprpicker-git hyprshade ghostscript poppler
```

**Terminal, browser and file manager:**

```
yay -S kitty firefox thunar
```

**Laptop brightness control:**

```
yay -S brightnessctl
```

**Desktop monitor brightness control:**

```
yay -S ddcutil
```

**Bluetooth:**

```
yay -S blueberry bluez bluez-utils
```

**Theming:**

```
yay -S papirus-icon-theme papirus-folders nwg-look-bin kvantum qt5ct qt6ct qt6-svg
```

**Fonts:**

```
yay -S ttf-ubuntu-font-family noto-fonts-emoji ttf-fira-code otf-font-awesome otf-font-awesome-4 ttf-droid ttf-fantasque-sans-mono ttf-jetbrains-mono ttf-jetbrains-mono-nerd inter-font-beta adobe-source-code-pro-fonts vazirmatn-fonts nerd-fonts
```

[Vazir Code Fonts](https://github.com/rastikerdar/vazir-code-font)

[Vazirmatn Fonts](https://github.com/rastikerdar/vazirmatn)

### Extra packages

Here are a collection of useful extra packages you might want to install:

**Package management:**

```
yay -S flatpak bauh octopi
```

**Utilities:**

```
yay -S file-roller gparted tmux simple-scan qdirstat nvtop
```

**Internet and networking:**

```
yay -S brave-bin google-chrome chromium telegram-desktop gufw filezilla
```

**Spell check:**

```
yay -S enchant ispell hunspell hunspell-en_us
```

**TTS:**

```
yay -S speech-dispatcher
pipx install mycroft-mimic3-tts
```
Checkout [mimic3 config](#mimic3-configuration).

**Codecs:**

```
yay -S ffmpeg ffmpegthumbnailer ffmpegthumbs jasper lame libdca libdv gst-libav libtheora libvorbis libxv wavpack x264 x265 dav1d rav1e xvidcore dvd+rw-tools dvdauthor dvgrab libmad libmpeg2 libdvdcss libdvdread libdvdnav exfat-utils fuse-exfat a52dec faac faad2 flac
```

```
sudo pacman -S gst-plugins-good gst-plugins-bad gst-plugins-base gst-plugins-ugly
```

**File systems:**

```
yay -S ntfs-3g ntfsprogs udf udftools dosfstools exfatprogs f2fs-tools hfsprogs reiser4progs
```

**Media:**

```
yay -S vlc mpv smplayer smplayer-themes ristretto spotify spicetify-cli
```

**Docs:**

```
yay -S foliate hyphen-en
```

**Productivity:**

```
yay -S libreoffice speedcrunch audacity gimp krita inkscape blender
```

**Development:**

```
yay -S neovim dotnet-sdk visual-studio-code-bin github-desktop-bin github-cli repo
```

**OBS:**

```
yay -S obs-studio
```

If you're not using `xdg-desktop-portal-hyprland`:

```
yay -S wlrobs wlrobs-hg gstreamer-vaapi obs-vaapi
```

**Gaming:**

```
yay -S steam heroic-games-launcher-bin lutris mangohud goverlay-bin gamemode lib32-gamemode
```

Lutris dependencies:

```
sudo pacman -S --needed wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader gpu-viewer fluidsynth python-protobuf innoextract lib32-vkd3d vkd3d lib32-libvdpa
```

Lutris Nvidia drivers:

```
sudo pacman -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader opencl-nvidia 
```

Input remapper:

```
yay -S input-remapper-git
sudo systemctl restart input-remapper
sudo systemctl enable input-remapper
```
**TUI:**

```
yay -S ranger mc cava cmatrix tty-clock pipes.sh screenfetch tetris-terminal-git fzf ytfzf btop
```

**Flatpak packages:**

```
flatpak install flathub net.nokyan.Resources com.github.tchx84.Flatseal com.discordapp.Discord
```

**Some electron apps work better installed using Flatpak and modified using Flatseal, instead of using electron flags.**

## Setting up Oh My Zsh and Powerlevel10k Theme

I personally used [JaKooLit's script](https://github.com/JaKooLit/Hyprland-v4) to install Oh My Zsh with `gnzh` theme. But you can use [rchrdwllm's instructions](https://github.com/rchrdwllm/dotfiles) to install it.

## Installing Pywal

If you want the regular Pywal, you can install it with `yay -S python-pywal`. But if you want 16 colors to be generated (which I use in this), you can install it by:

- Cloning [this](https://github.com/eylles/pywal16) repo
- `cd` into the repo and run `pip3 install --user . --break-system-packages`

## Copying the dotfiles

Once done, you can run the `install.sh` script found in this dotfiles directory and do a reboot after. Then, proceed to the next section.

Once done, you can go ahead and copy the files to their respective directories and do a reboot. Be sure to check out the [some notes](#some-notes) section in this README.

## Setting up VS Code

There's a [Pywal](https://marketplace.visualstudio.com/items?itemName=dlasagno.wal-theme) theme for VS Code. Colors will automatically update as well once you apply the theme.

## Setting up Firefox

If you use Firefox and want to have Pywal colors:

- Download the theme extension [here.](https://addons.mozilla.org/en-US/firefox/addon/pywalfox/)
- Run `pywalfox update` in your terminal.

Once done, you don't need to worry about manually updating the colors everytime you change your wallpaper. A script already takes care of that BUT you might need to manually restart Firefox to apply the new colors.

## Qt theming

Add the line below to the /etc/environments:

```
QT_QPA_PLATFORMTHEME=qt5ct
```

Please note that using the line above in my Hyprland config, caused some Qt apps to crash.

Also using the lines below in my environments file caused some Qt apps to crash as well.

With that said, your mileage may vary, so experiment with different environment options.

```
QT_QPA_PLATFORM="xcb;wayland"
GDK_BACKEND=wayland
```

## Some notes <a name="some-notes"></a>

- I don't know about you but in case you're experiencing a super slow reboot or shutdown with this, I followed [this](https://www.reddit.com/r/archlinux/comments/whsqdq/comment/ij9r90h/?utm_source=reddit&utm_medium=web2x&context=3) Reddit comment and it helped! Not really sure why that's happening, though.
- If you get an error on line 60 of `hyprland.conf` after rebooting saying that colors couldn't be found, be sure to check line 24. Replace "uiriamu" with your Linux username. After that, run `hyprctl reload` in your terminal. Once this is resolved, it shouldn't happen anymore for future reboots.
- This repo is also open to forks if you guys want to make changes of your own and take them into your own repository.

## Fixing miscellaneous problems

### Ly is not enabled

If you've already installed another login manager first run before enabling Ly:

```
sudo systemctl disable <the name of the login manager>
```

Use this line to enable Ly:

```
sudo systemctl enable ly
```


### Fix Obsidian lagging

Install it through flathub and then use Flatseal to turn off **gpu acceleration** for it.

### VS Code lagging / not launching

I've already added needed flags for VS Code to `~/.config/code-flags.conf file`.

### GitHub Desktop lagging

Running it with `--disable-gpu` would fix the problems.
You might want to add this flag to its .desktop file under `/usr/share/applications/` or add it to electron flags config file.

### Setting default applications

```
xdg-settings set default-web-browser firefox.desktop
xdg-mime default thunar.desktop inode/directory
xdg-mime default kitty.desktop application/x-shellscript
```

### Setting up ddcutil

Just run the commands below to use **ddcutil** without root permission:

```
sudo modprobe i2c-dev
ddcutil capabilities | grep "Feature: 10"
sudo cp /usr/share/ddcutil/data/45-ddcutil-i2c.rules /etc/udev/rules.d
sudo groupadd --system i2c
sudo usermod $USER -aG i2c
sudo touch /etc/modules-load.d/i2c.conf
sudo sh -c 'echo "i2c-dev" >> /etc/modules-load.d/i2c.conf'
sudo reboot
```

### Heroic Game Launcher not opening:

```
sudo nano /usr/share/dbus-1/services/org.freedesktop.Notifications.service
```

Add the following content:

```
[D-BUS Service]
Name=org.freedesktop.Notifications
Exec=/usr/lib/notification-daemon-1.0/notification-daemon
```

### mimic3 configuration:
[Docs](https://mycroft-ai.gitbook.io/docs/mycroft-technologies/mimic-tts/mimic-3#installation)

```
mimic3-download 'en_US/*'
```

- Make sure the mimic3-server is running (for testing only):

```
mimic3-server
```

- Make sure `/etc/speech-dispatcher/modules/mimic3-generic.conf` contains below text:

```
Debug 0

GenericExecuteSynth \
"printf %s \'$DATA\' | mimic3 --remote --voice \'$VOICE\' --stdout | $PLAY_COMMAND"

GenericCmdDependency "mimic3"
GenericSoundIconFolder "/usr/share/sounds/sound-icons/"

GenericPunctNone ""
GenericPunctSome "--punct=\"()[]{};:\""
GenericPunctMost "--punct=\"()[]{};:\""
GenericPunctAll "--punct"

AddVoice	"af"	"FEMALE1"	"af_ZA/google-nwu_low"
AddVoice	"bn"	"FEMALE1"	"bn/multi_low"
AddVoice	"de"	"MALE1"		"de_DE/thorsten_low"
AddVoice	"de"	"MALE2"		"de_DE/thorsten-emotion_low"
AddVoice	"de"	"MALE3"		"de_DE/m-ailabs_low"
AddVoice	"el"	"FEMALE1"	"el_GR/rapunzelina_low"
AddVoice	"en"	"MALE1"		"en_UK/apope_low"
AddVoice	"en"	"MALE1"		"en_US/hifi-tts_low"
AddVoice	"en"	"FEMALE1"	"en_US/ljspeech_low"
AddVoice	"en"	"MALE2"		"en_US/m-ailabs_low"
AddVoice	"en"	"MALE3"		"en_US/cmu-arctic_low"
AddVoice	"en"	"FEMALE2"	"en_US/vctk_low"
AddVoice	"es"	"MALE1"		"es_ES/carlfm_low"
AddVoice	"es"	"MALE2"		"es_ES/m-ailabs_low"
AddVoice	"fa"	"FEMALE1"	"fa/haaniye_low"
AddVoice	"fi"	"MALE1"		"fi_FI/harri-tapani-ylilammi_low"
AddVoice	"fr"	"FEMALE1"	"fr_FR/m-ailabs_low"
AddVoice	"fr"	"FEMALE2"	"fr_FR/siwis_low"
AddVoice	"fr"	"MALE1"		"fr_FR/tom_low"
AddVoice	"gu"	"FEMALE1"	"gu_IN/cmu-indic_low"
AddVoice	"ha"	"MALE1"		"ha_NE/openbible_low"
AddVoice	"hu"	"FEMALE1"	"hu_HU/diana-majlinger_low"
AddVoice	"it"	"MALE1"		"it_IT/mls_low"
AddVoice	"it"	"MALE2"		"it_IT/riccardo-fasol_low"
AddVoice	"jv"	"MALE1"		"jv_ID/google-gmu_low"
AddVoice	"ko"	"FEMALE1"	"ko_KO/kss_low"
AddVoice	"ne"	"FEMALE1"	"ne_NP/ne-google_low"
AddVoice	"nl"	"MALE1"		"nl/bart-de-leeuw_low"
AddVoice	"nl"	"MALE2"		"nl/flemishguy_low"
AddVoice	"nl"	"FEMALE1"	"nl/nathalie_low"
AddVoice	"nl"	"MALE3"		"nl/pmk_low"
AddVoice	"nl"	"MALE4"		"nl/rdh_low"
AddVoice	"pl"	"FEMALE1"	"pl_PL/m-ailabs_low"
AddVoice	"ru"	"FEMALE1"	"ru_RU/multi_low"
AddVoice	"sw"	"MALE1"		"sw/lanfrica_low"
AddVoice	"te"	"MALE1"		"te_IN/cmu-indic_low"
AddVoice	"tn"	"FEMALE1"	"tn_ZA/google-nwu_low"
AddVoice	"uk"	"MALE1"		"uk_UK/m-ailabs_low"
AddVoice	"vi"	"FEMALE1"	"vi_VN/vais1000_low"
AddVoice	"to"	"MALE1"		"yo/openbible_low"

DefaultVoice    "en_US/ljspeech_low"
```

- Make sure this file `/etc/speech-dispatcher/speechd.conf` contains the text below:

```
LogLevel  3

LogDir  "default"

DefaultVolume 100

SymbolsPreproc "char"

SymbolsPreprocFile "gender-neutral.dic"
SymbolsPreprocFile "font-variants.dic"
SymbolsPreprocFile "symbols.dic"
SymbolsPreprocFile "emojis.dic"
SymbolsPreprocFile "orca.dic"
SymbolsPreprocFile "orca-chars.dic"

Include "clients/*.conf"

DefaultVoiceType  "FEMALE1"
DefaultModule mimic3-generic
DefaultLanguage "en"
# Remove the line below if you're on Archlinux with pipewire
AudioOutputMethod "libao"
```

- Restart the speech-dispatcher:

```
sudo systemctl restart speech-dispatcher
```

- Test if it works:

```
spd-say 'Hello from speech dispatcher.'
```

### Systemd Service
> If this doesn't work add mimic3-server to hyprland startup.
> 
To ensure that Mimic 3 runs at boot, create a systemd service at `$HOME/.config/systemd/user/mimic3.service` with the contents:

```
[Unit]
Description=Run Mimic 3 web server
Documentation=https://github.com/MycroftAI/mimic3

[Service]
ExecStart=/path/to/mimic3-server

[Install]
WantedBy=default.target
```

Make sure to change `/path/to/mimic3-server` to wherever you installed Mimic 3.

You can find the location of it by running `which mimic3` command.

```
systemctl --user daemon-reload
```

Now try starting the service:

```
systemctl --user start mimic3
```

If that's successful, ensure it starts at boot:

```
systemctl --user enable mimic3
```

Verify the web server is running by visiting: http://localhost:59125/