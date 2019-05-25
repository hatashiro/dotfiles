" CtrlP
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'],
    \ 2: ['.ctrlp', 'bash -c "cd %s && git ls-files -co --exclude-standard"'],
    \ },
  \ }

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

let g:ctrlp_root_markers = ['.ctrlp']

" Set ts
function! SetIndent(size)
  let &ts=a:size
  let &sw=a:size
  let &sts=a:size
endfunction
call SetIndent(2)
command! -nargs=1 Ts call SetIndent(<f-args>)

" cursorline and colorcolumn
set nocursorline
set colorcolumn=80

" Reduce delays
set ttimeout
set ttimeoutlen=0
set matchtime=0

" vue
autocmd BufNewFile,BufRead *.vue set filetype=html

" html
let g:syntastic_html_checkers = []
