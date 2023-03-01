# Setup

## Info
- Bar: Polybar
- OS: Kali Linux
- WM: [i3-gaps](https://github.com/Airblader/i3) fork (repository no longer active read-only, use i3 v4.22).
- Terminal: Alacritty
- Fonts: JetBrains, Montserrat, Material Design, Iosevka (Nerd Fonts) ...
- Compositor: [Picom](https://github.com/sdhand/picom)
- Icons: [McMojave Circle](https://github.com/vinceliuice/McMojave-circle)
- Launcher: Rofi 1.7.3

## Screenshots
![](/screenshots/s1.png)
![](/screenshots/s2.png)
![](/screenshots/s3.png)

## Installation
Run `install.sh` as a non-root user.
```bash
./install.sh
```
After running script:
- Icons: install [McMojave](https://github.com/vinceliuice/McMojave-circle) icons from its repository, run `./install.sh`.
- Wallpaper: set a wallpaper by editing `~.fehbg` or running `feh --bg-fill /path/to/img.ext`.
- Colorscheme: grab some wallpaper and run `pywal -i filename` to create your color scheme then add to .zshrc : `(cat ~/.cache/wal/sequences &)`.
- i3: keyboard is configured to layout **latam**, add your layout at the end of the config file.
- Modules Polybar: there are three modules for eth0, hackthebox (tun1) and tryhackme (tun0), left clic to copy IP, it uses xclip. Edit polybar config file and script/[file].sh to set the correct interface.
- Rofi: change transparency of rofi launcher and powermenu in colors.rasi (background) and spotlight-dark.rasi (bg0) it uses [rrggbbaa](https://github.com/davatorium/rofi/blob/next/doc/rofi-theme.5.markdown#color).
- Picom: change opacity in `opacity-rule`.

## Shortcuts
mod = windows key
|Shortcut|Description|
|---|---|
|mod+q|Close/Kill window|
|mod+enter|Open Terminal|
|mod+left|Switch focus to window on the left|
|mod+righ|Switch focus to window on the right|
|mod+up|Switch focus to window at the top|
|mod+down|Switch focus to window at the bottom|
|mod+shift+left|Move current window to left|
|mod+shift+right|Move current window to right|
|mod+shift+up|Move current window to top|
|mod+shift+down|Move current window to bottom|
|mod+h|Split horizontal orientation|
|mod+v|Split vertical orientation|
|mod+f|Fullscreen a window/window|
|mod+s|Change layout to stack mode|
|mod+e|Change layout to togle split mode|
|mod+w|Change layout to togle tabbed mode|
|mod+shift+space|Toggle floating mode of window|
|mod+space|Focus on floating mode window|
|mod+space|Focus parent container|
|mod+r|(up,down,left,right) Resize mode current window esc to exit rezise mode|
|mod+1|Move to workspace 1|
|mod+2|Move to workspace 2|
|mod+3|Move to workspace 3|
|mod+4|Move to workspace 4|
|mod+5|Move to workspace 5|
|mod+6|Move to workspace 6|
|mod+7|Move to workspace 7|
|mod+8|Move to workspace 8|
|mod+9|Move to workspace 9|
|mod+10|Move to workspace 10|
|mod+shift+1|Move the current window to workspace 1|
|mod+shift+2|Move the current window to workspace 2|
|mod+shift+3|Move the current window to workspace 3|
|mod+shift+4|Move the current window to workspace 4|
|mod+shift+5|Move the current window to workspace 5|
|mod+shift+6|Move the current window to workspace 6|
|mod+shift+7|Move the current window to workspace 7|
|mod+shift+8|Move the current window to workspace 8|
|mod+shift+9|Move the current window to workspace 9|
|mod+shift+10|Move the current window to workspace 10|
|mod+shift+c|Reload i3|
|mod+shift+r|Restart i3|
|mod+shift+e|Exits i3|
|mod+d|Opens rofi application launcher|

## Wallpaper
Taken from https://wallhaven.cc/