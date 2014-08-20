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
