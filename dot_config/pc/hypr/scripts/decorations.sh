#!/bin/bash

# Объявление переменных
var_stacking_mode=~/.config/hypr/scripts/var/staking_mode_state.txt # Переменная состояния bar'ов 
stacking_mode_is_toggle="`cat $var_stacking_mode`" # Включён ли staking_mode


# При аргументе --stacking-mode включение/выключение плагина hyprland hyprbars в зависимости от состояния плагина и добавление параметров в конфиг hyprland
if [[ "$@" =~ "--stacking_mode" ]];
then

  if [ "$stacking_mode_is_toggle" == "false" ];
  then
    echo "true" > "$var_stacking_mode" # Изменение состояния stacking mode - включено
    sed -i '232i\windowrulev2 = float, class:.*' ~/.config/hypr/hyprland.conf # Добавление на 232 строку конфига hyprland режима floating по умолчанию
    hyprpm enable hyprbars -nn && hyprctl dismissnotify # Включение плагина hyprbars и отклонение уведомления о включении
  else
    echo "false" > "$var_stacking_mode" # Изменение состояния stacking mode - выключено
    sed -i '/windowrulev2 = float, class:.*/d' ~/.config/hypr/hyprland.conf # Удаление 232 строки конфига hyprland режима floating по умолчанию
    hyprpm disable hyprbars && hyprctl dismissnotify  # Отключение плагина hyprbars и отклонение уведомления об отключении
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
  echo -e "--stacking-mode\n    Toggle stacking mode"
fi
