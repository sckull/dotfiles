#!/bin/bash

# colors
RED="\e[31m\e[1m"
GREEN="\e[32m\e[1m"
END="\e[21m\e[0m"

# vars
dir=`pwd`

echo -e "${RED}Installing programs and dependencies ... ${END}"

sudo apt -y update 

sudo apt install -y arandr flameshot arc-theme feh i3blocks i3status i3 i3-wm lxappearance python3-pip rofi unclutter \
						cargo imagemagick zsh polybar xclip

# some dependencies
sudo apt install -y libxcb-keysyms1-dev libpango1.0-dev  xcb libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev \
						libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev \
						libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev autoconf meson

# picom dependencies
sudo apt install -y libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev \
						libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev \
						libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev \
						libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libpcre3 libpcre3-dev

sudo apt install -y meson ninja-build lsd picom 

sudo apt install -y kitty scrot scrub bat locate ranger neofetch wmname acpi bspwm sxhkd cmatrix zenity



#sudo apt install -y alacritty

#if ! command -v alacritty &> /dev/null
#then
#    echo -e "${RED}alacritty is not installed\n${GREEN}.. trying with cargo, it may take a few minutes ..${END}"
#	sudo cargo install alacritty
#fi
#sleep 1

pip3 install pywal --break-system-packages
sleep 1

# ohmyzsh
echo -e "${GREEN}Installing ohmyzsh ... ${END}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended &>/dev/null
if [ -d ~/.oh-my-zsh ]; then
        echo -e "${GREEN}oh-my-zsh installed. ${END}"
 else
        echo -e "${RED}oh-my-zsh is not installed, check https://ohmyz.sh ${END}"
fi


# p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# zsh-syntax-highlighting
sudo apt install -y zsh-syntax-highlighting zsh-autosuggestions
sudo mkdir /usr/share/zsh-sudo
cd /usr/share/zsh-sudo
sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

# ROOT zshrc
sudo ln -s -fv ~/.zshrc /root/.zshrc

###############
#     font    #
###############
FDIR="$HOME/.local/share/fonts"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
mkdir -p $FDIR

cp -rf $dir/fonts/ "$FDIR"

# Instalamos las HackNerdFonts
sudo cp -v $dir/fonts/HNF/* /usr/local/share/fonts/

# Instalando Fuentes de Polybar
sudo cp -v $dir/fonts/polybarfonts/* /usr/share/fonts/truetype/

echo -e "${GREEN}Building fonts cache .. ${END}"
fc-cache -f || die "Unable to build fonts cache"
sleep 2


# config files
echo -e "${GREEN}Copying config files to $HOME ... ${END}"

# mkdir -p ~/.config/alacritty
mkdir -p ~/.config/kitty
mkdir -p ~/.config/picom
mkdir -p ~/.config/dunst
mkdir -p ~/.config/bspwm
mkdir -p ~/.config/polybar
mkdir -p ~/.config/rofi
mkdir -p ~/.config/scripts
mkdir -p ~/.config/wall
mkdir -p ~/.config/sxhkd
mkdir -p ~/.oh-my-zsh/themes/

# chmod sxhkdrc bspwmrc
cp -rf $dir/.config ~/
cp $dir/.fehbg ~/.fehbg
cp $dir/.tmux.conf ~/.tmux.conf

# ZSHRC & P10K
rm -rf ~/.zshrc
cp -v $dir/.zshrc ~/.zshrc

cp -v $dir/.p10k.zsh ~/.p10k.zsh
sudo cp -v $dir/.p10k.zsh /root/.p10k.zsh

# If vmware
# sudo apt install mesa-utils
