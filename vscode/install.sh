#!/usr/bin/env bash

setdir="$(pwd)/$(dirname $0)"
codedir="$HOME/Library/Application Support/Code/User"

mkdir -p $codedir

function copy(){
  rm -f "$codedir/$1.json"
  ln -s "$setdir/$1.json" "$codedir/$1.json"
}

copy settings
copy keybindings
