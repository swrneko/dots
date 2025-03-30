#!/bin/bash
# Запуск mako для уведомлений сверху
mako --config ~/.config/mako/notification.conf &

# Запуск mako для уведомлений снизу
mako --config ~/.config/mako/volume.conf &
