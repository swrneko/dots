#!/bin/bash

# Объявление переменных
var_stacking_mode=~/.config/hypr/scripts/var/staking_mode_state.txt # Переменная состояния bar'ов 
stacking_mode_is_toggle="`cat $var_stacking_mode`" # Включён ли staking_mode

# При аргументе --bars включение/выключение плагина hyprland hyprbars в зависимости от состояния плагина
if [[ "$@" =~ "--bars" ]];
then

  if [ "$stacking_mode_is_toggle" == "false" ];
  then
    echo "true" > "$var_stacking_mode"
    hyprpm enable hyprbars -nn && hyprctl dismissnotify   
  else
    echo "false" > "$var_stacking_mode"
    hyprpm disable hyprbars && hyprctl dismissnotify 
  fi

fi

# При аргументе --startup-notify отображение стартового сообщения приветствия без звука
if [[ "$@" =~ "--startup-notify" ]];
then
  makoctl mode -a welcom
  sleep 2.4
  notify-send  "おかえりなさい、swrneko!"  "(づ｡◕‿‿◕｡)づ❤" 
  makoctl mode -t welcom
fi

# При аргументе --snow включение скрипта запуска снега на рабочем столе
if [[ "$@" =~ "--snow" ]];
then
  hyprctl dispatch exec /home/swrneko/.ZSnoW/bin/waysnow 
fi

# При аргументе --help или отсутствии введённых аргументов отображение сообщения помощи
if [[ "$@" =~ "--help" ]] || [[ "$1" == "" ]];
then
  echo "Avalible args:"
  echo -e "--help\n    Show this message"
  echo -e "--snow\n    Meke snow on wallapepr"
  echo -e "--startup-notify\n    Exec startup notify"
fi
