#!/usr/bin/env python3
import sys
import subprocess


def query():
    stdout = subprocess.check_output(['synclient'])
    for line in stdout.decode().split('\n'):
        if '=' in line:
            key, value = line.split('=', 1)
            if key.strip() == 'TouchpadOff':
                return value.strip()


def update(value):
    subprocess.check_call(['synclient', f'TouchpadOff={value}'])
    return query()


touchpad_off = query()

if len(sys.argv) > 1 and sys.argv[1] == 'toggle':
    touchpad_off = update('2' if touchpad_off == '0' else '0')
    if touchpad_off == '0':
        #
        # syndaemon gets confused when we tweak TouchpadOff ourselves, so we
        # restart it here.
        #
        subprocess.call("killall syndaemon".split())
        subprocess.check_call("syndaemon -i 2.0 -d -t -K".split())
elif len(sys.argv) > 1 and sys.argv[1] == 'off':
    touchpad_off = update('1')

#
# TouchpadOff=2 means disable clicks, etc. but still allow mouse movements
#
text = {'0': 'ON', '1': 'OFF', '2': 'BLK'}[touchpad_off]
print(f'🐾 {text}')
if text == 'OFF':
    print()
    print('#ff0000')
elif text == 'BLK':
    print()
    print('#ff6900')
