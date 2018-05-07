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

" Mouse setting
set mouse=nicr

" Colorscheme
set termguicolors

" cursorline and colorcolumn
set nocursorline
set colorcolumn=80
" hi ColorColumn ctermbg=237 ctermfg=None cterm=NONE

" Clipboard
set clipboard=unnamed

" Reduce delays
set ttimeout
set ttimeoutlen=0
set matchtime=0

" Haskell
" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
autocmd BufRead,BufWritePost *.hs GhcModCheckAsync

" multiple-cursor
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = []
let g:syntastic_scss_checkers = []

" vue
autocmd BufNewFile,BufRead *.vue set filetype=html

" html
let g:syntastic_html_checkers = []

" javascript
let g:flow#enable = 0
