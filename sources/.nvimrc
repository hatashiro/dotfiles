call plug#begin('~/.nvim/plugged')
source ~/.nvim/package.vim
call plug#end()

filetype plugin indent on
syntax on

source ~/.nvim/default.vim
source ~/.nvim/setting.vim
source ~/.nvim/command.vim
source ~/.nvim/key.vim
