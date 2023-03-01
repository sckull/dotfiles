#!/bin/bash

# colors
RED="\e[31m"
GREEN="\e[32m"
END="\e[0m"

# vars
dir=`pwd`

# sudo apt-get install -y arandr flameshot arc-theme feh i3blocks i3status i3 i3-wm lxappearance python3-pip rofi unclutter cargo compton papirus-icon-theme imagemagick
# sudo apt-get install -y arandr flameshot arc-theme feh i3blocks i3status lxappearance python3-pip rofi unclutter cargo compton papirus-icon-theme imagemagick

echo -e "${RED}Installing programs and dependencies ... ${END}"
# no compton
sudo apt-get install -y arandr flameshot arc-theme feh i3blocks i3status i3 i3-wm lxappearance python3-pip rofi unclutter \
						cargo imagemagick zsh polybar xclip

sudo apt-get install -y cargo meson ninja

# some dependencies
sudo apt-get install -y libxcb-keysyms1-dev libpango1.0-dev  xcb libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev \
						libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev \
						libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev autoconf meson

# picom dependencies
sudo apt-get install -y libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev \
						libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev \
						libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev \
						libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libpcre3 libpcre3-dev


# Alacritty 
# https://github.com/alacritty/alacritty/blob/master/INSTALL.md#cargo-installation
echo -e "${GREEN}Installing Alacritty with apt ... ${END}"
# git clone https://github.com/jwilm/alacritty
# cd alacritty
# cargo build --release && sudo cp target/release/alacritty /usr/local/bin
# cd $dir

sudo apt install -y alacritty

if ! command -v alacritty &> /dev/null
then
    echo -e "${RED}alacritty is not installed\n${GREEN}.. trying with cargo, it may take a few minutes ..${END}"
	sudo cargo install alacritty
fi
sleep 2

# picom >> compton 
echo -e "${GREEN}Installing picom ... ${END}"
git clone https://github.com/sdhand/picom.git && cd picom
git submodule update --init --recursive
sudo meson --buildtype=release . build
sudo ninja -C build
sudo ninja -C build install
cd $dir


# i3-gaps
echo -e "${GREEN}Installing i3-gaps ... ${END}"

git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps && mkdir -p build && cd build && meson ..
ninja
sudo ninja install
cd $dir

# pywal 
echo -e "${GREEN}Installing pywal ... ${END}"

pip3 install pywal
sleep 2

# ohmyzsh
echo -e "${GREEN}Installing ohmyzsh ... ${END}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended &>/dev/null
if [ -d ~/.oh-my-zsh ]; then
        echo -e "${GREEN} oh-my-zsh installed. ${END}"
 else 
        echo -e "${RED} oh-my-zsh is not installed, check https://ohmyz.sh ${END}"
fi


###############
#     font    #
###############
echo -e "${GREEN}Installing fonts ... ${END}"
echo -e "${GREEN}Font: JetBrainMono .. ${END}"
FDIR="$HOME/.local/share/fonts"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
mkdir -p $FDIR
echo -e "${GREEN}Font: polybar-themes, Iosevka Nerd Font, Material Design and Montserrat .. ${END}"
cp -rf $dir/fonts/ "$FDIR"
sleep 2
echo -e "${GREEN}Building fonts cache .. ${END}"
fc-cache -f || die "Unable to build fonts cache"
sleep 2
# config files
echo -e "${GREEN}Copying config files to $HOME ... ${END}"

mkdir -p ~/.config/alacritty
mkdir -p ~/.config/compton
mkdir -p ~/.config/dunst
mkdir -p ~/.config/i3
mkdir -p ~/.config/polybar
mkdir -p ~/.config/rofi
mkdir -p ~/.config/scripts
mkdir -p ~/.config/wall
mkdir -p ~/.oh-my-zsh/themes/

cp -rf .config ~/
cp .fehbg ~/.fehbg
cp .zshrc ~/.zshrc
cp pi.zsh-theme ~/.oh-my-zsh/themes/

# echo -e "${GREEN} Themes for MATE terminal https://github.com/HattDroid/MateTermColors ${END}"
# echo -e "${GREEN} Themes for Gnome terminal https://gogh-co.github.io/Gogh/ ${END}"
echo -e "${GREEN}Terminal: make sure 'alacritty' is installed if not, try to install with cargo or apt"
echo -e "Wallpaper: set a wallpaper by editing ~.fehbg"
echo -e "Colorscheme: grab some wallpaper and run pywal -i filename to set your color scheme then add to .zshrc : (cat ~/.cache/wal/sequences &)"
echo -e "i3: keyboard is configured to layout latam, add your layout at the end of i3/config"
echo -e "Polybar: left clic to copy IP, edit polybar/config and script/[vpn].sh to set the correct interface in hackthebox, tryhackme and eth0"
echo -e "Icons: manually install https://github.com/vinceliuice/McMojave-circle "
echo -e "After reboot: Select i3 on login. ${END}"
sleep 1