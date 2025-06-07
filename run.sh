#!/bin/bash

want_apply_config=n
want_apply_scripts=n

read -p "Do you want to apply config to system config folder ($HOME/.config?) (y/N): " want_apply_config
read -p "Do you want to apply scripts to system scripts folder ($HOME/.local/bin?) (y/N): " want_apply_config

if [ "echo "${PWD##*/}"" -eq "dots" ];
then
  
else
  cd ~/dots
fi

