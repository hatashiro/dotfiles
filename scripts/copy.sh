#!/bin/sh

# Copyright (c) 2012 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license.

OSC_52_MAX_SEQUENCE="100000"

tmux_dcs() {
  printf '\033Ptmux;\033%s\033\\' "$1"
}

print_seq() {
  local seq="$1"
  if [ -n "${TMUX-}" ]; then
    tmux_dcs "${seq}"
  else
    echo "${seq}"
  fi
}

b64enc() {
  base64 | tr -d '\n'
}

main() {
  if [ ! -z "$VTE_VERSION" ]; then
    # Gnome Terminal (VTE) doesn't support OSC 52, just use xclip.
    if [ $# -eq 0 ]; then
      xclip -selection clipboard
    else
      echo "$@" | xclip -selection clipboard
    fi
  elif [ -x "$(command -v pbcopy)" ]; then
    # In macOS (with pbcopy) just execute pbcopy.
    if [ $# -eq 0 ]; then
      pbcopy
    else
      echo "$@" | pbcopy
    fi
  else
    local str
    if [ $# -eq 0 ]; then
      str="$(b64enc)"
    else
      str="$(echo "$@" | b64enc)"
    fi

    local len=${#str}
    if [ ${len} -lt ${OSC_52_MAX_SEQUENCE} ]; then
      print_seq "$(printf '\033]52;c;%s\a' "${str}")"
    else
      echo "ERROR: selection too long to send to terminal:" \
        "${OSC_52_MAX_SEQUENCE} limit, ${len} attempted"
      exit 1
    fi
  fi
}

main "$@"
