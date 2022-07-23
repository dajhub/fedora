#!/bin/bash

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
echo "That's it...FINISHED..."
echo "To get to login screen type in: 'reboot'"
echo "############################################"
echo "############################################"