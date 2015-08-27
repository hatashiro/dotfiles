" CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" Set ts
function! SetIndent(size)
  let &ts=a:size
  let &sw=a:size
  let &sts=a:size
endfunction
call SetIndent(2)
command! -nargs=1 Ts call SetIndent(<f-args>)

" Sets
set cursorline
set colorcolumn=80

" Mouse setting
set mouse=nicr

" Colorscheme
let base16colorspace=256
colorscheme base16-eighties
set background=dark

" xterm settings
set term=xterm-256color
set t_Co=256
set t_ut=

" Clipboard
set clipboard=unnamed

" Emoji
if emoji#available()
  set completefunc=emoji#complete
endif

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
autocmd FileType * call SuperTabChain(&completefunc, "<c-p>")

" Reduce delays
set ttimeout
set ttimeoutlen=0
set matchtime=0
