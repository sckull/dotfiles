#!/bin/bash
dir=`pwd`
#sudo apt-get install -y arandr flameshot arc-theme feh i3blocks i3status i3 i3-wm lxappearance python3-pip rofi unclutter cargo compton papirus-icon-theme imagemagick
#sudo apt-get install -y arandr flameshot arc-theme feh i3blocks i3status lxappearance python3-pip rofi unclutter cargo compton papirus-icon-theme imagemagick

# no compton
sudo apt-get install -y arandr flameshot arc-theme feh i3blocks i3status i3 i3-wm lxappearance python3-pip rofi unclutter cargo papirus-icon-theme imagemagick
sudo apt-get install -y arandr flameshot arc-theme feh i3blocks i3status lxappearance python3-pip rofi unclutter cargo papirus-icon-theme imagemagick

sudo apt-get install -y libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev autoconf meson
sudo apt-get install -y libxcb-render-util0-dev libxcb-shape0-dev libxcb-xfixes0-dev 
sudo apt-get install -y polybar xclip

# picom dependencies
sudo apt-get install -y libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev  libpcre2-dev  libevdev-dev uthash-dev libev-dev libx11-xcb-dev

##################
# i3-gaps border #
##################
#git clone https://github.com/terroo/i3-radius
#cd i3-radius && sudo sh build.sh
#cd ..

#############
# Alacritty #
#############
git clone https://github.com/jwilm/alacritty
cd alacritty
cargo build --release && sudo cp target/release/alacritty /usr/local/bin
cd $dir

###################
# picom > compton #
###################
git clone https://github.com/sdhand/picom.git && cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd $dir

#############
#  i3-gaps  #
#############
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps && mkdir -p build && cd build && meson ..
ninja
sudo ninja install
cd $dir

#############
#   pywal   #
#############
pip3 install pywal

###############
# Copy Config #
###############
mkdir -p ~/.config
cp -r .config ~/
cp .fehbg ~/.fehbg
cp .zshrc ~/.zshrc

echo "Done! Grab some wallpaper and run pywal -i filename to set your color scheme. To have the wallpaper set on every boot edit ~.fehbg"
echo "After reboot: Select i3 on login, run lxappearance and select arc-dark"

###############
#   ohmyzsh   #
###############
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir -p $ZSH_CUSTOM/themes
mv pi.zsh-theme $ZSH_CUSTOM/themes/

###############
#     font    #
###############
echo "Installing JetBrainMono Font .. \n"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
#echo "Make sure the font 'JetBrainMono' is installed."
#echo "If not, here you can found it: https://www.jetbrains.com/es-es/lp/mono/"
echo "Installing Fonts from polybar-themes"

FDIR="$HOME/.local/share/fonts"
cp -rf $dir/fonts/* "$FDIR"

