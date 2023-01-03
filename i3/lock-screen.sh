#!/bin/bash
random_image="$(ls -1 ~/Pictures/db/*.png | sort -R | head -n 1)"
i3lock -i "$random_image" -n
