#!/usr/bin/env bash

# Make directory for old files
if [ ! -d "$PWD/old" ]; then
  mkdir old
else
  mv old older
  mkdir old
  mv older old/
fi

# List of files to ignore
ignore="
.gitignore
"

# Link dotfiles
for f in `find . -name ".*" -type f`
do
  filename=$(basename $f)
  path=$PWD/$filename

  if [ -f "$HOME/$filename" ]; then
    mv $HOME/$filename ./old/
  fi

  if [[ ! " $ignore " =~ $filename ]]; then
    ln -s $path ~/
  fi
done
