#!/bin/sh

export QT_SCALE_FACTOR=1.65
export GDK_SCALE=1
export GDK_DPI_SCALE=1.0

xsetroot -cursor_name left_ptr
ibus-daemon -rxRd
xrdb ~/.Xresources
steam -forcedesktopscaling=1.5 %U -silent &
telegram-desktop -startintray &
webcord -m &
firefox &

sxhkd &
exec bspwm
