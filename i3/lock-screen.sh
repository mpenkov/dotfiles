#!/bin/bash
#
# Ensure backlight is not off, otherwise we'll have to unlock while blind.
# It's a pity the backlight keys don't work while i3lock is running...
#
if [ $(xbacklight | cut -d. -f1) == "0" ]; then
    xbacklight -set 50
fi
#
# Ensure QWERTY keyboard layout, otherwise we don't be able to unlock the screen
#
workswitch -inputlanguage english
random_image="$(ls -1 ~/Pictures/db/*.png | sort -R | head -n 1)"
i3lock -i "$random_image" -n
