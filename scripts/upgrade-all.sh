#!/usr/bin/env bash

set -e

command_exists() {
  command -v $1 &> /dev/null
}

# Update, upgrade and autoremove Apt packages.
if command_exists apt; then
  sudo apt update
  sudo apt upgrade -y
  sudo apt autoremove -y
fi

# Upgrade Snap packages.
if command_exists snap; then
  sudo snap refresh
fi

# Check if a reboot is required.
if [ -f /var/run/reboot-required ]; then
  echo -n "Reboot required. Want to reboot now? [y/N] "
  read should_reboot
  if [ "$should_reboot" = "y" ]; then
    echo "Rebooting..."
    sudo reboot
  fi
fi
