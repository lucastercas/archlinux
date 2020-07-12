let mapleader=","

" Save and exit
nnoremap <leader>w :w!<cr>
nnoremap <leader>x :x!<cr>
nnoremap <C-s> :w<CR>

" Fix spell
inoremap <leader>l <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap <leader>l <c-g>u<Esc>[s1z=`]a<c-g>u

" Disable current search highlight
nnoremap <leader>h :noh<CR>

" I hate ESC
inoremap jk <Esc>

" Move on multilines
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Disable help
nmap <F1> :echo<CR>
imap <F1> :echo<Cr>
imap <F1> <C-o>:echo<CR>

"map 0 ^

" Save with sudo
command! W w !sudo tee % > /dev/null

" Use system clipboard
noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>Y "+y
noremap <leader>P "+p

" Better windows navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>p :Files<CR>
nnoremap <leader>f :Ag<CR>
nnoremap <leader>i :ALEFix<CR>

" FZF Mappings
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" NeoVim Terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

