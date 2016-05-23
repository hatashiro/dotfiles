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

" Sets
set cursorline
set colorcolumn=80

" Mouse setting
set mouse=nicr

" Colorscheme
" colorscheme anderson
" hi ColorColumn ctermbg=237 ctermfg=None cterm=NONE
set background=dark
colorscheme solarized

" Sets
set nocursorline
set colorcolumn=80

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

" hardtime
let g:hardtime_default_on = 1
let g:hardtime_timeout = 500
let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+"]
let g:list_of_insert_keys = []

" neco
let g:deoplete#enable_at_startup = 1
let g:necoghc_enable_detailed_browse = 1
let g:deoplete#file#enable_buffer_path = 1
