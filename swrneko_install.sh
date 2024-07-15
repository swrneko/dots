#!/bin/bash
output=""

clear

echo "Arch Linux installation script by swrneko (git) "

default_change() {
    echo "Do u want to use default config? [y/n]"
    read answr

    if [[ $answr == "y" ]]
    then
        echo "ok"
        output=0
    elif [[ $answr == "n" ]]
    then
        echo "not ok"
        output=1
    else
        default_change
    fi
}

main_loop() {
    exec rfkill unblock wifi
    exec 
}

main_loop_changed() {
}

default_change

if [[ $output == 0 ]]
then
    main_loop
elif [[ $output == 1 ]]
then
    main_loop_changed
else
    echo
fi
