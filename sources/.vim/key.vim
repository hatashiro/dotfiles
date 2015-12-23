" EasyMotion
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" NERDTree
nmap <Leader>. :NERDTreeToggle %<CR>

" Multiple Indent
vmap >> >><ESC>gv
vmap << <<<ESC>gv

" NERDCommenter
nmap <C-\> <Leader>c<Space>
vmap <C-\> <Leader>c<Space>

" Tagbar
nmap <Leader>, :TagbarToggle<CR>

" Disable arrows
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
noremap <S-Up> <NOP>
noremap <S-Down> <NOP>
noremap <S-Left> <NOP>
noremap <S-Right> <NOP>
inoremap <S-Up> <NOP>
inoremap <S-Down> <NOP>
inoremap <S-Left> <NOP>
inoremap <S-Right> <NOP>

" Use shift+navigation
vnoremap <S-k> <NOP>
vnoremap <S-j> <NOP>
vnoremap <S-h> <NOP>
vnoremap <S-l> <NOP>

" Enable control+j/k
inoremap  <C-k>  k
noremap   <C-k>  k

" Remap D into deletion without yanking.
" Deletion without yanking is mapped to d.
nnoremap D d
nnoremap d "_d
vnoremap D d
vnoremap d "_d

au FileType haskell nnoremap <buffer> <C-T> :GhcModType<CR>
au FileType haskell nnoremap <buffer> <C-T>q :GhcModTypeClear<CR>
au FileType haskell nnoremap <buffer> <C-T>i :GhcModInfo<CR>
