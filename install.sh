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
for f in `find sources -name ".*" -maxdepth 1`
do
  filename=$(basename $f)
  path=$PWD/$f

  mv $HOME/$filename ./old/

  ln -s $path ~/
done

# Remove dangling symlinks in $HOME
find -L $HOME -type l -maxdepth 1 | xargs rm
