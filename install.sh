#!/bin/bash

sudo apt-get install -y arandr flameshot arc-theme feh i3blocks i3status i3 i3-wm lxappearance python3-pip rofi unclutter cargo compton papirus-icon-theme imagemagick
sudo apt-get install -y arandr flameshot arc-theme feh i3blocks i3status lxappearance python3-pip rofi unclutter cargo compton papirus-icon-theme imagemagick
sudo apt-get install -y libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev autoconf meson
sudo apt-get install -y libxcb-render-util0-dev libxcb-shape0-dev libxcb-xfixes0-dev 

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
cd ..

#############
#  i3-gaps  #
#############
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps && mkdir -p build && cd build && meson ..
ninja
sudo ninja install
cd ../..

#############
#   pywal   #
#############
pip3 install pywal

###############
# Copy Config #
###############
mkdir -p ~/.config
cp -r .config/ ~/.config/
cp .fehbg ~/.fehbg
cp .zshrc ~/.zshrc

echo "Done! Grab some wallpaper and run pywal -i filename to set your color scheme. To have the wallpaper set on every boot edit ~.fehbg"
echo "After reboot: Select i3 on login, run lxappearance and select arc-dark"

###############
#   ohmyzsh   #
###############
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

###############
#     font    #
###############
echo "Make sure the font 'JetBrainMono' is installed."
echo "If not, here you can found it: https://www.jetbrains.com/es-es/lp/mono/"