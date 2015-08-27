export ZSH=$HOME/.oh-my-zsh
# https://github.com/sindresorhus/pure
ZSH_THEME="pure"

# Personal scripts
export PERSONAL_SCRIPT_PATH=$HOME/.dotfiles/scripts
export PATH=$PATH:$PERSONAL_SCRIPT_PATH

# Check tmux status
if [ -z $TMUX ]; then
  tmux-status
fi

# Plugin settings
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false

plugins=(github osx tmux)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="$PATH:/usr/local/bin:$HOME/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/MacGPG2/bin"

# homebrews should always take precedence
export PATH=/usr/local/bin:~/bin:$PATH
function git(){hub $@}

# base-16
BASE16_SCHEME="eighties"
BASE16_SHELL="$HOME/.dotfiles/resources/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

# Scala and etc
export SCALA_HOME=$HOME/Works/env/scala
export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF8 -Djava.library.path=$HOME/Works/env/java.library.path"

# Java Home
export JAVA_HOME=`/usr/libexec/java_home`

# Java
jv() {
  local java_home=`/usr/libexec/java_home -v 1.$1`
  export JAVA_HOME=$java_home
}

# Go
export PATH=$PATH:$HOME/Works/env/go/go/bin
export GOPATH=$HOME/Works/env/go
export PATH=$PATH:$GOPATH/bin

# pypy
export PATH=$PATH:$HOME/Works/env/pypy3/bin
alias pypy='pypy3.2'

# added by travis gem
[ -f /Users/noraesae/.travis/travis.sh ] && source /Users/noraesae/.travis/travis.sh

# tmux
alias tmux-reload="tmux source-file ~/.tmux.conf"

# nvm
export NVM_DIR="/usr/local/var/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# F#
export PATH=$PATH:$HOME/Works/env/fsharp/mono64/bin
export PATH=$PATH:$HOME/Works/env/fsharp/nuget/bin
alias fsc=fsharpc
alias fsi=fsharpi

# Ruby
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Emacs
export EDITOR=emacs
alias em=emacs
