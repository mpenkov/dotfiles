#!/bin/bash
#
# Keyboard layout indicator.  Warns me when I have Russian keyboard enabled.
#
layout="$(ibus engine)"
if [ $layout == "table:russian-ELECOM" ]; then
  echo 🔵 ЙЦУКЕН
  echo
  echo "#ff0000"
elif [ "$layout" == "xkb:jp::jpn" ]; then
  echo 🟢 QWERTY
else
  echo 🔴 日 本 語
fi
