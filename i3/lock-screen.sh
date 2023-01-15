#!/bin/bash
#
# Ensure QWERTY keyboard layout, otherwise we don't be able to unlock the screen
#
workswitch -inputlanguage english
random_image="$(ls -1 ~/Pictures/db/*.png | sort -R | head -n 1)"
i3lock -i "$random_image" -n
