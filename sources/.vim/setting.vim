" CtrlP
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'],
    \ 2: ['.ctrlp', 'cd %s && git ls-files -co --exclude-standard'],
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

" Sets
set cursorline
set colorcolumn=80

" Mouse setting
set mouse=nicr

" Colorscheme
colorscheme anderson
hi CursorLine ctermbg=237 ctermfg=None cterm=NONE
hi ColorColumn ctermbg=237 ctermfg=None cterm=NONE

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

" Haskell
" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

" multiple-cursor
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0
