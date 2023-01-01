#!/usr/bin/env python
"""Prints screen lock information to stdout for i3wm and i3blocks.

Gives me some advance warning for when the session is about to get locked.
"""
import io
import re
import subprocess
import sys

regex = re.compile(r'^  timeout: +(\d+)')

stdout = subprocess.check_output('xset -q'.split())
buf = io.StringIO(stdout.decode())
timeout = -1
for line in buf:
    match = regex.match(line)
    if match:
        timeout = int(match.group(1))
        break

if timeout < 0:
    print('🔒: ?:??')
    print('unable to parse timeout from xset', file=sys.stderr)
    sys.exit(1)

red = False
if timeout == 0:
    #
    # This means the screensaver has been disabled
    #
    print('🔓')
    red = True
else:
    idle = int(subprocess.check_output(['xprintidle']))
    remainder = timeout - idle // 1000
    if remainder < 300:
        minutes = remainder // 60
        seconds = remainder % 60
        print(f'🔒: {minutes}:{seconds:02}')

    if remainder < 60:
        red = True

if red:
    print()
    print('#ff0000')
