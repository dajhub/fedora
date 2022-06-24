#!/bin/bash

HOSTNAME=zen

print "\n\e[0;33mSystem setup\e[0m"

# ---

echo 'Set hostname...'

hostnamectl set-hostname "$HOSTNAME"

# ---

sudo dnf install xorg-x11-server-Xorg xorg-x11-xinit network-manager-applet\
 xorg-x11-drv-libinput mesa-dri-drivers xfce4-panel xfce4-datetime-plugin\
 xfce4-session xfce4-settings xfce4-terminal xfconf xfdesktop\
 xfce4-appfinder xfce4-power-manager xfce4-pulseaudio-plugin pulseaudio\
 gvfs lightdm-gtk xfwm4 NetworkManager-wifi; # Required package for XFCE desktop

# ---

systemctl enable lightdm; # Enable login using graphical interface
systemctl set-default graphical.target; # Boot to graphical interface as default

# ---

echo 'Install RPM Fusion...'

sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


# ---

echo 'Install Flathub...'

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# ---

echo 'Upgrade DNF...'

sudo dnf upgrade --refresh -qy

# ---

echo 'Install DNF packages...'

sudo dnf install -qy \
    firefox \
    pluma \
    geany \
    file-roller \
    kitty \
    htop \
    neofetch \
    xfce4-whiskermenu-plugin \
    viewnior \
    abiword \
    flameshot \
    gcolor3 
# ---

echo 'Finished...'









