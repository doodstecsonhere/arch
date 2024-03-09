#remove packages
sudo pacman -Rns --noconfirm \
xfce4-dict \
xfburn && \
#install pacman packages
sudo pacman -Syu --noconfirm --needed \
networkmanager \
linux-firmware \
lightdm-gtk-greeter-settings \
kcalc \
ksnip \
kdeconnect \
sshfs \
onboard \
spotify-launcher \
smplayer \
mpv \
qbittorrent \
timeshift \
neofetch \
gnome-control-center \
gnome-online-accounts \
htop \
unzip \
flatpak && \
#install yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd && \
#add chaotic aur repo
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com && sudo pacman-key --lsign-key 3056513887B78AEB && sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' && echo -e "[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf && sudo pacman -Syu --noconfirm && \
#install yay packages
yay -S --needed --noconfirm --sudoloop --removemake \
stremio \
pimpmystremio-bin \
stremio-service-bin \
rescuetime2 \
stacer-bin \
floorp-bin \
onlyoffice-bin \
google-chrome \
megasync-bin \
xfce4-panel-profiles-git \
microsoft-edge-stable-bin \
teamviewer \
zoom \
bibata-cursor-theme-bin \
normcap \
peazip-gtk2-bin \
tgpt-bin \
mugshot \
timeshift-autosnap \
penguins-eggs \
mkinitcpio-openswap \
chrome-remote-desktop-bin && \
#colorize and optimize terminal
sudo sed -i 's/#Color/Color/' /etc/pacman.conf && sudo sed -i 's/#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf && sudo sed -i '/Color/a ILoveCandy' /etc/pacman.conf && wget https://averagelinuxuser.com/assets/images/posts/2019-01-18-linux-terminal-color/Linux_terminal_color.zip && mkdir Downloads && mv Linux_terminal_color.zip ~/Downloads && cd Downloads && unzip Linux_terminal_color.zip && sudo mv bash.bashrc /etc/bash.bashrc && sudo mv DIR_COLORS /etc/ && mv .bashrc ~/.bashrc && cd && \
#auto clear cache
sudo systemctl enable paccache.timer && \
#cleanup
sudo rm ~/Downloads/Linux_terminal_color.zip  -r yay arch && sudo pacman -Scc --noconfirm && sudo pacman -Rns --noconfirm $(pacman -Qtdq) && \
#teamviewer service
sudo bash -c 'cat > /etc/systemd/system/teamviewerd.service << EOF
     [Unit]
     Description=TeamViewer Daemon
     After=network.target
     [Service]
     Type=forking
     ExecStart=/opt/teamviewer/tv_bin/teamviewerd -f
     ExecStop=/opt/teamviewer/tv_bin/teamviewerd -e
     Restart=always
     RestartSec=12
     [Install]
     WantedBy=multi-user.target
     EOF' && \
sudo systemctl enable teamviewerd.service
