#!/bin/bash

function start_install() {
  echo "start_install"
  exit 0
}

want_install=n
read -p "Do you want to install arch linux? All files bay me corrupt! (y/N): " want_install

if [ "$want_install" = "y" ] || [ "$want_install" = "Y" ];
then
  start_install
else
  exit 1
fi


