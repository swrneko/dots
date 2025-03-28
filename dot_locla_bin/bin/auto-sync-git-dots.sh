#!/bin/bash

cd ~/dots
git pull
cd ~/ && cp -r ~/.config/hypr ~/.config/kitty ~/.config/nvim ~/.config/wofi ~/.config/waybar/ ~/dots/dot_config_new
cp -r ~/.local/bin ~/dots/dot_locla_bin/

cd ~/dots && git add .

if [ $1 ];
then
  git commit -m "$1" && git push origin main
else
  git commit -m "auto commit" && git push origin main
fi


