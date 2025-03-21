#!/usr/bin/env bash

caps_lock_state=$(xset -q | sed -n 's/^.*Caps Lock:\s*\(\S*\).*$/\1/p')

# If caps lock is on, turn it off.
if [ $caps_lock_state = 'on' ]; then
  xdotool key Caps_Lock
fi
