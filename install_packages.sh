#!/bin/bash
sudo pacman -Syu --needed alacritty neovim git zsh ly waybar wofi wmctrl xdg-desktop-portal-hyprland imv xdotool fcitx5 fcitx5-im ranger nwg-look qt5ct playerctl feh evince freecad brightnessctl bluez bluez-utils blueberry pavucontrol steam libreoffice telegram-desktop firefox neofetch ttf-0xproto-nerd adobe-source-han-sans-jp-fonts adobe-source-han-serif-jp-fonts noto-fonts-cjk ttf-hanazono ttf-sazanami breeze oxygen kvantum adapta-gtk-theme arc-gtk-theme breeze-gtk gnome-themes-extra materia-gtk-theme dotnet-sdk wl-clipboard lutris htop gst-libav phonon-qt5-gstreamer gst-plugins-good qt5-quickcontrols qt5-graphicaleffects qt5-multimedia slurp grim imv vlc audacity pipewire pipewire-pulse android-tools ibus-anthy ibus
cd ~/ && git clone https://aur.archlinux.org/pakku.git && cd ~/pakku/ && makepkg -si
cd ~/dots && cp -r dot_config/* ~/.config
sudo cp pakku.conf /etc 
sudo cp org.freecad.FreeCAD.desktop /usr/share/applications
pakku -Syu waypaper-git swww mako waybar-module-pacman-updates-git wlr-protocols-git qwlroots-git webcord android-sdk-platform-tools ibus-daemon ibus-autostart
echo "All installed SUCCSESSFULLY!!!"
