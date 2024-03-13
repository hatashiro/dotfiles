#!/usr/bin/bash

# Ensure sudo.
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

ntpdate -v time.google.com
