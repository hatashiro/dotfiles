#!/usr/bin/env bash

# Make directory for old files
if [ ! -d "$PWD/old" ]; then
  mkdir old
else
  mv old older
  mkdir old
  mv older old/
fi

# Link dotfiles
for f in `find configs -maxdepth 1`
do
  filename=$(basename $f)
  path=$PWD/$f

  mv $HOME/.$filename ./old/

  ln -s $path ~/.$filename
done

# Remove dangling symlinks in $HOME
find -L $HOME -maxdepth 1 -type l | xargs rm

# Set default command-line settings
if [[ $OSTYPE == 'darwin'* ]]; then
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
fi
