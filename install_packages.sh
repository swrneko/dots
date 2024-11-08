#!/bin/bash

want_install=n
want_config=n

echo "It's the installation package and set config for source file script"
read -p "Do you want to install packages? (y/N): " want_install

if [ "$want_install" = "y" ] || [ "$want_install" = "Y" ];
then
  sudo pacman -Syu --needed alacritty neovim git zsh ly waybar wofi wmctrl xdg-desktop-portal-hyprland imv xdotool fcitx5 fcitx5-im ranger nwg-look qt5ct playerctl feh evince freecad brightnessctl bluez bluez-utils blueberry pavucontrol steam libreoffice telegram-desktop firefox neofetch ttf-0xproto-nerd adobe-source-han-sans-jp-fonts adobe-source-han-serif-jp-fonts noto-fonts-cjk ttf-hanazono ttf-sazanami breeze oxygen kvantum adapta-gtk-theme arc-gtk-theme breeze-gtk gnome-themes-extra materia-gtk-theme dotnet-sdk wl-clipboard lutris htop gst-libav phonon-qt5-gstreamer gst-plugins-good qt5-quickcontrols qt5-graphicaleffects qt5-multimedia slurp grim imv vlc audacity pipewire pipewire-pulse android-tools ibus-anthy ibus

else
  echo

fi

read -p "Do you want to change configuration on you'r machine to configuration from this script? (y/N): " want_config
if [ "$want_config" = "y" ] || [ "$want_config" = "Y" ];
then
  cd ~/ && git clone https://aur.archlinux.org/pakku.git && cd ~/pakku/ && makepkg -si
  cd ~/dots && cp -r dot_config/* ~/.config && cp .Xauthority .Xresources .xinitrc ~/
  sudo cp some_another_files/pakku.conf /etc 
  sudo cp some_another_files/org.freecad.FreeCAD.desktop /usr/share/applications
  pakku -Syu waypaper-git swww mako waybar-module-pacman-updates-git wlr-protocols-git qwlroots-git webcord android-sdk-platform-tools ibus-daemon ibus-autostart
  echo "You need to write this i nvim: LspInstall bashls clangd mesonlsp csharp_ls cario_ls ts_ls ast_grep cssmodules_ls fsautocomplete pyright"
  echo "All installed SUCCSESSFULLY!!!"
  exit 0

else
  exit 1

fi
