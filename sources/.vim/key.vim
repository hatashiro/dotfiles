" EasyMotion
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" NERDTree
nmap <Leader>. :NERDTreeToggle %<CR>

" Multiple Indent
vmap >> >><ESC>gv
vmap << <<<ESC>gv

" Copy to & Paste from clipboard for Mac
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>
nmap <C-V> :r !pbpaste<CR>

" NERDCommenter
nmap <C-\> <Leader>c<Space>
vmap <C-\> <Leader>c<Space>

" Tagbar
nmap <Leader>, :TagbarToggle<CR>
