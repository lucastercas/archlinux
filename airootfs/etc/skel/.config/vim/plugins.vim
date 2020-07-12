call plug#begin('~/.vim/plugged')
  Plug 'sheerun/vim-polyglot'  " Syntax highlight, language pack (syntax hightlight, indentation, etc)
  Plug 'morhetz/gruvbox'       " Colorscheme
  "Plug 'itchyny/lightline.vim' " Status line on bottom
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'Yggdroot/indentLine'   " Indent line on the right
  Plug 'junegunn/fzf'          " Fuzzy finder dependency
  Plug 'junegunn/fzf.vim'      " Fuzzy finder
  "Plug 'tpope/vim-fugitive'   " Git
  Plug 'jiangmiao/auto-pairs'  " Auto close brackets, etc
  "Plug 'mattn/emmet-vim'      " HTML completion
  Plug 'mhinz/vim-startify'    "Start Screen
  "Plug 'vimwiki/vimwiki'      " Wiki
  Plug 'dense-analysis/ale'    " Lint Engine
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Lightline
"let g:lightline = {
"      \ 'colorscheme': 'gruvbox',
"      \  'active': {
"      \    'left': [
"      \      [ 'mode', 'paste' ],
"      \      [ 'readonly', 'filename', 'modified', 'gitstatus']
"      \    ],
"      \  },
"      \  'component_function':  {
"      \    'gitstatus': 'fugitive#head',
"      \  },
"      \ }
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='base16_gruvbox_dark_hard'

" Gruvbox
let g:gruvbox_contrast_dark="medium"

" ALE
"let g:ale_linters = { 'javascript': ['prettier', 'eslint'], 'typescript': ['prettier', 'tslint'] }
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': [ 'prettier', 'eslint' ],
      \}
let g:ale_completion_enabled = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? 'OK' : printf(
        \   '%d⨉ %d⚠ ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

" Indent Lne
let g:indentLine_setConceal = 2
let g:indentLine_concealcursor = ""

" Ulti Snips
let g:UltiSnipsSnippetsDir="~/.config/vim/my_snippets"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

" Startify
let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': [ '  Bookmarks' ] },
      \ { 'type': 'sessions', 'header': [ 'Saved Sessions' ] }
      \ ]
let g:startify_bookmarks = [
      \ { 'sad': '~/workspace/unasus/saiteava/image'},
      \ { 'sa': '~/workspace/unasus/saiteava/saiteava'},
      \ { 'mdl': '~/workspace/projects/moodle/image'},
      \ { 'eq': '~/workspace/freela/euquero'}
      \ ]
