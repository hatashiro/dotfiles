#!/usr/bin/env bash

root_dir=$(realpath $(dirname $0))
dotfiles_dir="$root_dir/dotfiles"
backup_dir="$root_dir/backup"

# Helper function for backup.
function backup {
  dest_path=$1
  backup_link_path="${backup_dir}/$2"
  backup_file_path="${backup_link_path}_$(date +"%Y%m%d%H%M%S")"

  mkdir -p $(dirname $backup_link_path)

  # Back up only if it's different from current backup.
  if ! diff $dest_path $backup_link_path &> /dev/null; then
    mv $dest_path $backup_file_path
    ln -sf $(basename $backup_file_path) $backup_link_path
  fi
}

# Install dotfiles.
for filename in $(ls $dotfiles_dir); do
  orig_path="${dotfiles_dir}/${filename}"
  dest_path="${HOME}/.${filename}"

  # If already installed, skip.
  if [ -L $dest_path ] && [ $(readlink $dest_path) = $orig_path ]; then
    continue
  fi

  # Back up any existing file or directory.
  if [ -f $dest_path ] || [ -d $dest_path ]; then
    backup $dest_path "dotfiles/${filename}"
  fi

  ln -sf $orig_path $dest_path
done

# Remove dangling symlinks in $HOME
find -L $HOME -maxdepth 1 -type l | xargs rm

# Set default command-line settings
if [[ $OSTYPE == 'darwin'* ]]; then
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
fi
