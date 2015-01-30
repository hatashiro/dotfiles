if has('vim_starting')
  if &compatible
    set nocompatible " Be iMproved
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

source ~/.vim/package.vim

call neobundle#end()

filetype plugin indent on
syntax on

NeoBundleCheck

source ~/.vim/default.vim
source ~/.vim/setting.vim
source ~/.vim/command.vim
source ~/.vim/key.vim
