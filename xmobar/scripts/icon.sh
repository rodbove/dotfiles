#!/bin/bash

ICON=$(cat /home/rodrigo/.config/xmobar/scripts/icon)
if [ $ICON == "cat.xpm" ]; then
    echo "dog.xpm" > /home/rodrigo/.config/xmobar/scripts/icon
fi

if [ $ICON == "dog.xpm" ]; then
    echo "cat.xpm" > /home/rodrigo/.config/xmobar/scripts/icon
fi

echo $ICON
