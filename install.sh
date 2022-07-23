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

sudo dnf install xorg-x11-server-Xorg xorg-x11-xinit network-manager-applet\
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


echo "###############################################"
echo '# RPM Fusion & Flathub Installed...'
echo "###############################################"

# ---

echo "###############################################"
echo '# Installing DNF packages...'
echo "###############################################"

sudo dnf install -qy \
    firefox \
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
echo "# Creating private folders for later use"
echo "###############################################"

set -e

[ -d $HOME"/.icons" ] || mkdir -p $HOME"/.icons"
[ -d $HOME"/Documents" ] || mkdir -p $HOME"/Documents"
[ -d $HOME"/Pictures/wallpapers" ] || mkdir -p $HOME"/Pictures/wallpapers"
[ -d $HOME"/.themes" ] || mkdir -p $HOME"/.themes"
[ -d $HOME"/.local/share/fonts" ] || mkdir -p $HOME"/.local/share/fonts"
[ -d $HOME"/.config/gtk-3.0" ] || mkdir -p $HOME"/.config/gtk-3.0"
[ -d $HOME"/.config/kitty" ] || mkdir -p $HOME"/.config/kitty"
[ -d $HOME"/.config/geany" ] || mkdir -p $HOME"/.config/geany"
[ -d $HOME"/.config/rofi" ] || mkdir -p $HOME"/.config/rofi"
[ -d $HOME"/.config/xfce4/terminal" ] || mkdir -p $HOME"/.config/xfce4/terminal"


echo "###############################################"
echo "# Personal folders created or existed already"
echo "###############################################"

# ---

echo "###############################################"
echo "# Copy fonts to .local/share/fonts/"
echo "###############################################"

cp -R ~/fedora/fonts/* ~/.local/share/fonts/

fc-cache -fv ~/.fonts

echo "############################################"
echo "# Fonts have been copied and refreshed       "
echo "############################################"

# ---

echo "############################################"
echo "# Copy themes & icons to .themes & .icons"
echo "############################################"

cp -R ~/fedora/themes/* ~/.themes/

fc-cache -fv ~/.themes

# ---

cp -R ~/fedora/icons/* ~/.icons/

fc-cache -fv ~/.icons


echo "############################################"
echo "# Themes have been copied and refreshed   "
echo "############################################"

# ---

echo "############################################"
echo "# Copying files/folders i.e. gtk.css, kitty, geany, rofi, terminalrc"
echo "############################################"

cp -R ~/fedora/gtk.css ~/.config/gtk-3.0/
cp -R ~/fedora/kitty/* ~/.config/kitty/
cp -R ~/fedora/rofi/* ~/.config/rofi/
cp -R -f ~/fedora/terminalrc ~/.config/xfce4/terminal/
cp -R -f ~/fedora/geany/* ~/.config/geany/

echo "############################################"
echo "# Files/folders copied"
echo "############################################"

# ---

echo "############################################"
echo "# Copying wallpaperss"
echo "############################################"


cp -R ~/fedora/wallpapers/* ~/Pictures/wallpapers/


echo "############################################"
echo "# Wallpapers copied"
echo "############################################"

# ---

echo "############################################"
echo "############################################"
echo "FINISHED..."
echo "############################################"
echo "############################################"







