#!/usr/bin/env bash

this_path=$(readlink -f $0)
dotfiles_path=$(dirname $(dirname $this_path))
xmodmap_path="${dotfiles_path}/configs/Xmodmap"

caps_lock_state=$(xset -q | sed -n 's/^.*Caps Lock:\s*\(\S*\).*$/\1/p')

# If caps lock is on, turn it off.
if [ $caps_lock_state = 'on' ]; then
  xdotool key Caps_Lock
fi

# Reload xmodmap.
xmodmap $xmodmap_path
