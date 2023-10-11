#remove packages
sudo pacman -Rns --noconfirm \
xfce4-dict \
xfburn && \
#install pacman packages
sudo pacman -Syu --noconfirm --needed \
firefox \
linux-firmware \
pacman-contrib \
unzip \
lightdm-gtk-greeter-settings \
kcalc \
ksnip \
kdeconnect \
sshfs \
onboard \
spotify-launcher \
ibus \
picom \
xcompmgr \
smplayer \
qbittorrent \
timeshift \
neofetch \
git && \
#install yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd && \
#add chaotic aur repo
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com && sudo pacman-key --lsign-key 3056513887B78AEB && sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' && echo -e "[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf && sudo pacman -Syu --noconfirm && \
#install yay packages
yay -S --needed --noconfirm --sudoloop --removemake \
realvnc-vnc-viewer \
google-chrome \
megasync \
xfce4-panel-profiles \
microsoft-edge-stable \
teamviewer \
zoom \
bibata-cursor-theme \
normcap \
peazip \
tgpt-bin \
mugshot \
timeshift-autosnap \
penguins-eggs \
mkinitcpio-openswap \
chrome-remote-desktop && \
#colorize and optimize terminal
sudo sed -i 's/#Color/Color/' /etc/pacman.conf && sudo sed -i 's/#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf && sudo sed -i '/Color/a ILoveCandy' /etc/pacman.conf && wget https://averagelinuxuser.com/assets/images/posts/2019-01-18-linux-terminal-color/Linux_terminal_color.zip && mkdir Downloads && mv Linux_terminal_color.zip ~/Downloads && cd Downloads && unzip Linux_terminal_color.zip && sudo mv bash.bashrc /etc/bash.bashrc && sudo mv DIR_COLORS /etc/ && mv .bashrc ~/.bashrc && cd && sudo systemctl enable paccache.timer && \
#cleanup
sudo rm ~/Downloads/Linux_terminal_color.zip -r yay go && sudo pacman -Scc --noconfirm && sudo pacman -Rns --noconfirm $(pacman -Qtdq)
