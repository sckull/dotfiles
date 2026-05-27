# Kali
## Info
- Bar: Polybar
- OS: Kali Linux
- WM: bspwm
- Terminal: kitty
- Fonts: JetBrains, Montserrat, Material Design, Iosevka (Nerd Fonts) ...
- Compositor: Picom
- Icons: [McMojave Circle](https://github.com/vinceliuice/McMojave-circle)
- Launcher: Rofi

## Screenshots
![](/screenshots/s1.png)
![](/screenshots/s2.png)

## Installation
Run `install.sh` as a non-root user.
```bash
git clone https://github.com/sckull/dotfiles
cd dotfiles/kali
chmod +x install.sh
./install.sh
```
After running script:
- Icons: install [McMojave](https://github.com/vinceliuice/McMojave-circle) icons from its repository, run `./install.sh`.
- Wallpaper: set a wallpaper by editing `~.fehbg` or running `feh --bg-fill /path/to/img.ext`.
- Colorscheme: grab some wallpaper and run `pywal -i filename` to create your color scheme then add to .zshrc : `(cat ~/.cache/wal/sequences &)`.
- Modules Polybar: modules for eth0 (ethernet) and hackthebox (tun1), left clic to copy IP, it uses `xclip`. Edit polybar config file and `script/[file].sh` to set the correct interface.
- Rofi: change transparency of rofi launcher and powermenu in colors.rasi (background) and spotlight-dark.rasi (bg0) it uses [rrggbbaa](https://github.com/davatorium/rofi/blob/next/doc/rofi-theme.5.markdown#color).
- Picom: change opacity in `opacity-rule`.

## Shortcuts
mod = windows key
|Shortcut|Description|
|---|---|
|mod+w|Close/Kill window|
|mod+enter|Open Terminal|
|mod+left|Switch focus to window on the left|
|mod+righ|Switch focus to window on the right|
|mod+up|Switch focus to window at the top|
|mod+down|Switch focus to window at the bottom|
|mod+shift+left|Move current window to left|
|mod+shift+right|Move current window to right|
|mod+shift+up|Move current window to top|
|mod+shift+down|Move current window to bottom|
|mod+f|Fullscreen a window|
|mod+f|exit Fullscreen a window|
|mod+alt|(up,down,left,right) Resize mode current window esc to exit rezise mode|
|mod+1|Move to workspace 1|
|mod+2|Move to workspace 2|
|mod+3|Move to workspace 3|
|mod+4|Move to workspace 4|
|mod+5|Move to workspace 5|
|mod+shift+1|Move the current window to workspace 1|
|mod+shift+2|Move the current window to workspace 2|
|mod+shift+3|Move the current window to workspace 3|
|mod+shift+4|Move the current window to workspace 4|
|mod+shift+5|Move the current window to workspace 5|
|mod+alt+r|restart bspwm|
|mod+alt+1|exits bspwm|
|mod+d|Opens rofi application launcher|

For more: `.config/sxhkdrc`

## Wallpaper
Taken from https://wallhaven.cc/
