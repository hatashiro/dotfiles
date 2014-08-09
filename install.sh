#!/usr/bin/env bash

# Clean
git clean -dfx

if [ ! -d "$PWD/.old" ]; then
  mkdir .old
fi

for f in `find . -name ".*" -type f`
do
  filename=$(basename $f)
  path=$PWD/$filename
  if [ -f "$HOME/$filename" ]; then
    mv $HOME/$filename ./.old/
  fi

  ln -s $path ~/
done
