set -x PATH $PATH $HOME/.dotfiles/scripts

# tmux
if status --is-interactive
  if test -z (echo $TMUX)
    tmux-status
    if test $status -eq 0
      exec tmux
    end
  end
end

# aliases
alias vim 'nvim'
alias tmux-reload 'tmux source-file ~/.tmux.conf'
alias git 'hub'
alias bnode 'babel-node'

# settings
set -x EDITOR nvim
set -x TERM xterm-256color
set -e fish_greeting
set -x LESS '-R'

# path
set -x PATH /usr/local/bin $PATH
set -x PATH $HOME/.pyenv/shims $PATH
set -x PATH $PATH $HOME/bin
set -x PATH $PATH $HOME/.local/bin
set -x PATH $PATH $HOME/.stack/programs/x86_64-osx/ghc-8.0.1/bin
set -x PATH $PATH ./node_modules/.bin

# fnm
status --is-interactive; and fnm 6

# lang
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
