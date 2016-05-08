" EasyMotion
nmap f <Plug>(easymotion-fl)
nmap F <Plug>(easymotion-Fl)
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

" Enable control+j/k
noremap  <C-k>  <Up>
inoremap <C-k>  <Up>
noremap  <C-j>  <Down>
inoremap <C-j>  <Down>

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

" Remap D into deletion without yanking.
" Deletion without yanking is mapped to d.
nnoremap D d
nnoremap d "_d
vnoremap D d
vnoremap d "_d

au FileType haskell nnoremap <buffer> <C-T> :GhcModType<CR>
au FileType haskell nnoremap <buffer> <C-T>q :GhcModTypeClear<CR>
au FileType haskell nnoremap <buffer> <C-T>i :GhcModInfo<CR>

au FileType purescript nnoremap <buffer> <C-T> :PSCIDEtype<CR>

" Rainbow Parentheses
nmap <Leader>r :RainbowParentheses!!<CR>
