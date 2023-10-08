#remove packages
sudo pacman -Rns --noconfirm
xfce4-dict
xfburn &&
#install pacman packages
sudo pacman -Syu --noconfirm --needed
vivaldi
firefox
yt-dlp
linux-firmware
pacman-contrib
unzip
lightdm-gtk-greeter-settings
kcalc
ksnip
kdeconnect
sshfs
onboard
spotify-launcher
ibus
picom
xcompmgr
smplayer
qbittorrent
baobab
timeshift
neofetch
git 
ffmpeg &&
#install yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd &&
#add chaotic aur repo
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com && sudo pacman-key --lsign-key 3056513887B78AEB && sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' && echo -e "[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf &&
#install yay packages
yay -S --needed --noconfirm --sudoloop --removemake
realvnc-vnc-viewer
google-chrome
stremio
megasync
xfce4-panel-profiles
microsoft-edge-stable
teamviewer
zoom
bibata-cursor-theme
stacer
peazip
tgpt-bin
normcap
mugshot
ventoy-bin
timeshift-autosnap
normcap
penguins-eggs
mkinitcpio-openswap &&
#colorize and optimize terminal
sudo sed -i 's/#Color/Color/' /etc/pacman.conf && sudo sed -i 's/#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf && sudo sed -i '/Color/a ILoveCandy' /etc/pacman.conf && wget https://averagelinuxuser.com/assets/images/posts/2019-01-18-linux-terminal-color/Linux_terminal_color.zip && unzip Linux_terminal_color.zip && sudo mv bash.bashrc /etc/bash.bashrc && sudo mv DIR_COLORS /etc/ && mv .bashrc ~/.bashrc && sudo systemctl enable paccache.timer &&
#cleanup
sudo rm Linux_terminal_color.zip -r yay arch go && sudo pacman -Scc --noconfirm && sudo pacman -Rns --noconfirm $(pacman -Qtdq)
