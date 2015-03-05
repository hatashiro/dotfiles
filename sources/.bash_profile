alias ls="ls -G"

# homebrews should always take precedence
export PATH=/usr/local/bin:~/bin:$PATH

# Bash prompt
export PS1="\u:\w $ "

# Git autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

alias git=hub

export NVM_DIR="/usr/local/var/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
