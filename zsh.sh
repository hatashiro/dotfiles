#!/usr/bin/env bash
shell=$(which zsh)

echo "$shell" | sudo tee -a /etc/shells
chsh -s $shell
