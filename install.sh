#!/bin/bash
output=""

clear

echo "Arch Linux installation script by swrneko (git) "

default_change() {
    echo "Do u want to use default config? [y/n]"
    read answr

    if [[ $answr == "y" ]]
    then
        output=0
    elif [[ $answr == "n" ]]
    then
        output=1
    else
        default_change
    fi
}

start_loop() {
    if [[ $output == 0 ]]
    then
        main_loop
    elif [[ $output == 1 ]]
    then
        main_loop_changed
    else
        echo
    fi
}

main_loop() {
    rfkill unblock wifi
    iwctl station wlan0 connect HUAWEI 
    if ping ya.ru | grep -q "from"
    then
        return 1
    else
        exit 0
    fi
}

# main_loop_changed() {
# }

default_change
start_loop
