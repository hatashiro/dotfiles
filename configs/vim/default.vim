set backspace=indent,eol,start  " Allow backspacing over everything in insert mode.
set encoding=utf-8              " Set default encoding to UTF-8.
set fencs=ucs-bom,utf-8,cp949   " Add cp949 to the character encodings for the files
                                " written in the windows.
set fileformats=unix            " Show ^M for a carraige return.
set history=100                 " Number of lines of command line history.
set hlsearch                    " Highlight search matches.
set incsearch                   " Incremental search.
set ignorecase
set smartcase
set nobackup                    " Do not keep a backup file.
set nowritebackup
set swapfile                    " Swapfile directory.
set dir=/tmp
set noerrorbells                " No beeps.
set nostartofline               " Do not jump to first character with page commands,
set number                      " Show line number.
set ruler                       " Show the line and column numbers of the cursor.
set scrolloff=5                 " Keep a context when scrolling.
set showcmd                     " Show (partial) command in status line.
set showmatch                   " Show matching brackets.
set showmode                    " Show current mode.
set tabpagemax=50               " Extend maximum of tab page to 50 (default 10).
set tags=tags;/                 " http://stackoverflow.com/a/5019111
set nowrap
set textwidth=0                 " Don't wrap words by default.
set undolevels=200              " Number of undo levels.
set viminfo='20,\"50            " Read/write a .viminfo file, don't store more than
                                " 50 lines of registers.
set wildmode=list:longest       " Path/file expansion in colon-mode.
set wildchar=<TAB>              "
set laststatus=0                " No status line

set expandtab
set smarttab
set autoindent
set smartindent

" Show trailing spaces
set list
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>
set listchars+=precedes:<
