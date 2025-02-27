#!/usr/bin/env bash

this_path=$(readlink -f $0)
dotfiles_path=$(dirname $(dirname $this_path))
xmodmap_path="${dotfiles_path}/configs/Xmodmap"

caps_lock_state=$(xset -q | sed -n 's/^.*Caps Lock:\s*\(\S*\).*$/\1/p')

# If caps lock is on, turn it off.
if [ $caps_lock_state = 'on' ]; then
  xdotool key Caps_Lock
fi

caps_lock_map=$(xmodmap -pke | grep -G 'keycode\s*66\s*=')

# If caps lock is still caps lock, reload xmodmap.
if [[ $caps_lock_map =~ 'Caps_Lock' ]]; then
  xmodmap $xmodmap_path
fi
