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
colorscheme gruvbox
set background=dark
hi Comment cterm=None

" xterm settings
set term=xterm-256color
set t_Co=256
set t_ut=

" Disable some useless functions.
" * Shift-Arrow actions
noremap <S-Up> <Up>
noremap <S-Down> <Down>
noremap <S-Left> <Left>
noremap <S-Right> <Right>
inoremap <S-Up> <Up>
inoremap <S-Down> <Down>
inoremap <S-Left> <Left>
inoremap <S-Right> <Right>
