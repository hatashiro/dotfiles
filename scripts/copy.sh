#!/bin/sh
# Copyright (c) 2012 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
# Max length of the OSC 52 sequence.  Sequences longer than this will not be
# sent to the terminal.
OSC_52_MAX_SEQUENCE="100000"
# Write an error message and exit.
# Usage: <message>
die() {
  echo "ERROR: $*"
  exit 1
}
# Send a DCS sequence through tmux.
# Usage: <sequence>
tmux_dcs() {
  printf '\033Ptmux;\033%s\033\\' "$1"
}
# Send an escape sequence to hterm.
# Usage: <sequence>
print_seq() {
  local seq="$1"
  if [ -n "${TMUX-}" ]; then
    tmux_dcs "${seq}"
  else
    echo "${seq}"
  fi
}
# Base64 encode stdin.
b64enc() {
  base64 | tr -d '\n'
}
# Send the OSC 52 sequence to copy the content.
# Usage: [string]
copy() {
  if [ ! -z "$VTE_VERSION" ]; then
    # Gnome Terminal (VTE) doesn't support OSC 52, just use xclip
    if [ $# -eq 0 ]; then
      xclip -selection clipboard
    else
      echo "$@" | xclip -selection clipboard
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
      die "selection too long to send to terminal:" \
        "${OSC_52_MAX_SEQUENCE} limit, ${len} attempted"
    fi
  fi
}
# Write tool usage and exit.
# Usage: [error message]
usage() {
  if [ $# -gt 0 ]; then
    exec 1>&2
  fi
  cat <<EOF
Usage: osc52 [options] [string]
Send an arbitrary string to the terminal clipboard using the OSC 52 escape
sequence as specified in xterm:
  https://invisible-island.net/xterm/ctlseqs/ctlseqs.html
  Section "Operating System Controls", Ps => 52.
The data can either be read from stdin:
  $ echo "hello world" | osc52.sh
Or specified on the command line:
  $ osc52.sh "hello world"
EOF
  if [ $# -gt 0 ]; then
    echo
    die "$@"
  else
    exit 0
  fi
}
main() {
  set -e
  while [ $# -gt 0 ]; do
    case $1 in
    -h|--help)
      usage
      ;;
    -*)
      usage "Unknown option: $1"
      ;;
    *)
      break
      ;;
    esac
  done
  copy "$@"
}
main "$@"
