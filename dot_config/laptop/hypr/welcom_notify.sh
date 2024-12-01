#!/bin/bash
mako -c /home/swrneko/.config/mako/config_welcome
notify-send おかえりなさい swrneko!
killall -9 mako
mako -c /home/swrneko/.config/mako/config

