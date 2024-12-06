#!/bin/bash

#######################################################################################################################
# /$$$$$$$  /$$$$$$ /$$$$$$$$       /$$$$$$$$/$$$$$$/$$      /$$$$$$$$ /$$$$$$                                        #
#| $$__  $$/$$__  $|__  $$__/      | $$_____|_  $$_| $$     | $$_____//$$__  $$                                       #
#| $$  \ $| $$  \ $$  | $$         | $$       | $$ | $$     | $$     | $$  \__/                                       #
#| $$  | $| $$  | $$  | $$         | $$$$$    | $$ | $$     | $$$$$  |  $$$$$$                                        #
#| $$  | $| $$  | $$  | $$         | $$__/    | $$ | $$     | $$__/   \____  $$                                       #
#| $$  | $| $$  | $$  | $$         | $$       | $$ | $$     | $$      /$$  \ $$                                       #
#| $$$$$$$|  $$$$$$/  | $$/$$      | $$      /$$$$$| $$$$$$$| $$$$$$$|  $$$$$$/                     /$$               #
#|_______/ \______/   |__| $$      |__/     |______|________|________/\______/                     | $$               #
#                        | $$$$$$$ /$$   /$$        /$$$$$$$/$$  /$$  /$$ /$$$$$$ /$$$$$$$  /$$$$$$| $$   /$$ /$$$$$$ #
#                        | $$__  $| $$  | $$       /$$_____| $$ | $$ | $$/$$__  $| $$__  $$/$$__  $| $$  /$$//$$__  $$#
#                        | $$  \ $| $$  | $$      |  $$$$$$| $$ | $$ | $| $$  \__| $$  \ $| $$$$$$$| $$$$$$/| $$  \ $$#
#                        | $$  | $| $$  | $$       \____  $| $$ | $$ | $| $$     | $$  | $| $$_____| $$_  $$| $$  | $$#
#                        | $$$$$$$|  $$$$$$$       /$$$$$$$|  $$$$$/$$$$| $$     | $$  | $|  $$$$$$| $$ \  $|  $$$$$$/#
#                        |_______/ \____  $$      |_______/ \_____/\___/|__/     |__/  |__/\_______|__/  \__/\______/ #
#                                  /$$  | $$                                                                          #
#                                 |  $$$$$$/                                                                          #
#                                  \______/                                                                           #
#######################################################################################################################

#############
# VARIABLES #
#############
packages="`cat packages-pacman.txt`"
want_install=n
want_config=n
want_backup=y
want_grub_theme=y
want_pc=1

cd dots

#######################
# ASK SOME PROPERTIES #
#######################
echo "It's the installation package and set config for source file script"
read -p "Do you want to install packages? (y/N): " want_install
read "Do you want install PC version(1) or Laptop version(2) default=1: " want_pc
read "Do you want install grub theme(Y/n): " want_grub_theme
read "Would you like to make backup of .conkfig files? (Y/n): " want_backup
read -p "Do you want to change configuration on you'r machine to configuration from this script? (y/N): " want_config

######################
# INSTALL GRUB THEME #
######################
if [ "$want_grub_theme" = "y" ] || [ "$want_grub_theme" = "Y" ];
then 
  cd dots
  sudo ./grub/install_script_grub.sh
else
  echo
fi

###############
# MAKE BACKUP #
###############
if [ "$want_backup" = "y" ] || [ "$want_backup" = "Y" ];
then 
  echo "Backup will save in ~/.config_bckp"
  sudo cp -r ~/.config ~/.config_bckp
else
  echo
fi

####################
# INSTALL PACKAGES #
####################
if [ "$want_install" = "y" ] || [ "$want_install" = "Y" ];
then
  sudo pacman -Syu $packages
  cd ~/ && git clone https://aur.archlinux.org/pakku.git && cd ~/pakku/ && makepkg -si
  pakku -Syu waypaper-git swww mako waybar-module-pacman-updates-git wlr-protocols-git qwlroots-git webcord android-sdk-platform-tools ibus-daemon ibus-autostart
else
  echo
fi

################
# APPLY CONFIG #
################
if [ "$want_config" = "y" ] || [ "$want_config" = "Y" ];
then
  # GTK theme installation
  hyprpm add https://github.com/hyprwm/hyprland-plugins # add hyprland plugins
  hyprpm add https://github.com/KZDKM/Hyprspace # add workspace changer
  cd ~/dots/sddm && sudo cp -r corners /usr/share/sddm/themes/ && sudo cp -r sddm.conf.d /etc/
  xdg-mime default nemo.desktop inode/directory # setup default file manager
  sudo ln -s /usr/share/fontconfig/conf.avail/51-local.conf # make link for fontconfig
  sudo cp some_another_files/local.conf /etc/fonts/
  cd ~/dots
  cd /etc/fonts/conf.d
  sudo ln -s /usr/share/fontconfig/conf.avail/50-user.conf # make link for fontconfig
  sudo cp ~/dots/some_another_files/pakku.conf /etc/fonts/ # copy font fallback alias for alacritty 
  mkdir ~/.themes 
  cd dots && cp -r custom_themes/* ~/.themes/ 
  cd ~/dots && cp -r dot_config/* ~/.config && cp .Xauthority .Xresources .xinitrc ~/
  sudo cp some_another_files/pakku.conf /etc 
  sudo cp some_another_files/org.freecad.FreeCAD.desktop /usr/share/applications
  echo "You need to write this i nvim: LspInstall bashls clangd mesonlsp csharp_ls cario_ls ts_ls ast_grep cssmodules_ls fsautocomplete pyright"
  echo "All installed SUCCSESSFULLY!!!"
  exit 0
else
  exit 1
fi
