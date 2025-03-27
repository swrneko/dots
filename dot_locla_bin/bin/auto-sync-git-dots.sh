cd ~/dots
git pull
cd ~/ && cp -r ~/.config/hypr ~/.config/kitty ~/.config/nvim ~/.config/wofi ~/.config/waybar/ ~/dots/dot_config_new
cp -r ~/.local/bin ~/dots/dot_locla_bin/
cd ~/dots && git add . && git commit -m "auto commit from script" && git push origin main
