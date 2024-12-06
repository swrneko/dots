#!/bin/bash

var_dir=~/.config/hypr/scripts/var/staking_mode_state.txt
is_toggle="`cat $var_dir`"

if [ "$is_toggle" == "false" ];
then
  echo "true" > "$var_dir"
  hyprpm enable hyprbars -nn && hyprctl dismissnotify   
  echo 1
else
  echo "false" > "$var_dir"
  hyprpm disable hyprbars && hyprctl dismissnotify 
  echo 2
fi
