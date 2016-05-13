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
alias pypy 'pypy3.2'
alias tmux-reload 'tmux source-file ~/.tmux.conf'
alias git 'hub'

# settings
set -x EDITOR nvim
set -x TERM xterm-256color
set -e fish_greeting
set -x LESS '-R'

# path
set -x PATH /usr/local/bin $PATH
set -x PATH $PATH $HOME/bin
set -x PATH $PATH $HOME/Works/env/pypy3/bin
set -x PATH $PATH $HOME/.local/bin
set -x PATH $PATH $HOME/.stack/programs/x86_64-osx/ghc-7.10.3/bin
set -x PATH $PATH ./node_modules/.bin

# fin
fin 6
