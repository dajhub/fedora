#!/bin/bash

HOSTNAME=zen

print "\n\e[0;33mSystem setup\e[0m"

# ---

echo 'Set hostname...'

hostnamectl set-hostname "$HOSTNAME"

# ---

echo "###############################################"
echo '# Installing required packages for XFCE desktop...'
echo "###############################################"

sudo dnf install -qy xorg-x11-server-Xorg xorg-x11-xinit network-manager-applet\
 xorg-x11-drv-libinput mesa-dri-drivers xfce4-panel xfce4-datetime-plugin\
 xfce4-session xfce4-settings xfce4-terminal xfconf xfdesktop\
 xfce4-appfinder xfce4-power-manager xfce4-pulseaudio-plugin pulseaudio\
 gvfs lightdm-gtk xfwm4 NetworkManager-wifi; # Required package for XFCE desktop

# ---
echo "###############################################"
echo '# Enabling lightdm display manager...'
echo "###############################################"

systemctl enable lightdm; # Enable login using graphical interface
systemctl set-default graphical.target; # Boot to graphical interface as default

# ---

echo "###############################################"
echo '# Installing RPM Fusion & Flathub...'
echo "###############################################"

sudo dnf install -qy \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install -qy \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


# ---

echo 'Install Flathub...'

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# ---

echo 'Upgrading DNF...'

sudo dnf upgrade --refresh -qy


echo "###############################################"
echo '# RPM Fusion & Flathub Installed...'
echo "###############################################"

# ---

echo "###############################################"
echo '# Installing DNF packages.  This may take some time ...'
echo "###############################################"

sudo dnf install -qy \
    pluma \
    geany \
    file-roller \
    kitty \
    htop \
    neofetch \
    xfce4-whiskermenu-plugin \
    light-locker \
    xfce4-screenshooter \
    viewnior \
    abiword \
    flameshot \
    wget \
    xfce4-docklike-plugin \
    tumbler \
    tar\
    rofi \
    papirus-icon-theme.noarch \
    google-noto-cjk-fonts-common.noarch \
    gcolor2 


echo "###############################################"
echo '# DNF packages installed...'
echo "###############################################"

# ---

echo "###############################################"
echo '# Installing Librewolf...'
echo "###############################################"

sudo rpm --import https://keys.openpgp.org/vks/v1/by-fingerprint/034F7776EF5E0C613D2F7934D29FBD5F93C0CFC3

sudo dnf config-manager --add-repo https://rpm.librewolf.net

sudo dnf install -qy --refresh librewolf

echo "###############################################"
echo '# Librewolf installed...'
echo "###############################################"

# ---

echo "############################################"
echo "############################################"
echo "FINISHED..."
echo "To finish installation type: './2-install-remainder.sh'"
echo "############################################"
echo "############################################"







