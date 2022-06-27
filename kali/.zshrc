# oh-my-zsh
export ZSH="/home/kali/.oh-my-zsh"

# theme
ZSH_THEME="pi"

# plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# alacritty compiled with cargo
export PATH=$PATH:/home/kali/.cargo/bin

# vars
# wordlist vars
MD="/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt"
ROCK="/usr/share/wordlists/rockyou.txt"
CM="/usr/share/wordlists/dirb/common.txt"

# alias
alias cme="crackmapexec"
alias allports="nmap -p- --min-rate 10000 -oN allports"
alias hosts="sudo vim /etc/hosts"
alias zhrc="vim ~/.zshrc"
alias httpserver="sudo python3 -m http.server 80 --directory ~/htb/www/"
alias httphere="sudo python3 -m http.server 80 --directory $1"

alias htb_vpn="sudo openvpn --dev tun1 --config ~/htb/sckull.ovpn"
alias htb_arena="sudo openvpn --dev tun1 --config ~/htb/arena.ovpn"
alias thm_vpn="sudo openvpn --dev tun0 --config ~/thm/sckull.ovpn"
