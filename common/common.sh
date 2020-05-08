#!/bin/bash
sudo apt-get update
sudo apt-get purge -y \
    firefox

sudo apt-get install -y \
    curl htop mc mlocate git \
    flatpak flatpak-builder \
    baobab deja-dup gnome-tweak-tool \
    meld bless dconf-editor \
    bridge-utils qemu-kvm libvirt-daemon-system virt-manager \
    docker.io docker-compose \
    gnome-shell-extension-system-monitor \
    gnome-clocks gnome-calendar gnome-weather \
    gnome-backgrounds \
    ttf-mscorefonts-installer \
    totem transmission

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo flatpak install --noninteractive flathub \
    org.gtk.Gtk3theme.Yaru-dark \
    org.mozilla.firefox \
    org.telegram.desktop \
    com.bitwarden.desktop \
    com.skype.Client

sudo snap install chromium rambox

# Fix problem with icons
sudo sed -i "s/this._iconSize      = icon_size$/& + 1/" /usr/share/gnome-shell/extensions/ubuntu-appindicators@ubuntu.com/appIndicator.js

if [ ! -f ~/.ssh/id_ed25519 ]; then
    ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519
fi

git config --global user.name "Sergey Khoroshavin"
git config --global user.email "skhoroshavin@gmail.com"

sudo usermod -aG docker xop
sudo usermod -aG libvirt xop

gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.screensaver lock-delay 0
gsettings set org.gnome.desktop.search-providers disabled "['org.gnome.Characters.desktop']"
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true

gsettings set org.gnome.settings-daemon.plugins.xsettings hinting full
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Super>t']"
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 3600
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type nothing

gsettings set org.gnome.shell.extensions enabled-extensions "['system-monitor@paradoxxx.zero.gmail.com']"

gsettings set org.gnome.shell.extensions.system-monitor icon-display false
gsettings set org.gnome.shell.extensions.system-monitor cpu-graph-width 40
gsettings set org.gnome.shell.extensions.system-monitor cpu-show-text false
gsettings set org.gnome.shell.extensions.system-monitor memory-graph-width 40
gsettings set org.gnome.shell.extensions.system-monitor memory-show-text false
gsettings set org.gnome.shell.extensions.system-monitor net-graph-width 40
gsettings set org.gnome.shell.extensions.system-monitor net-show-text false

gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false

gsettings set org.gnome.clocks world-clocks "[{'location': <(uint32 2, <('Stuttgart', 'EDDS', true, [(0.84968445169480855, 0.16086118520990819)], [(0.85113890437366546, 0.16027939715704839)])>)>}]"
gsettings set org.gnome.shell.weather locations "[<(uint32 2, <('Voronezh', 'UUOO', true, [(0.90146255865507119, 0.68504173140777425)], [(0.90180996644268074, 0.68403410047072044)])>)>]"
