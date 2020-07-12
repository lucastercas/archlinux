set history=500
set nocompatible " Not compatible with Vi

set mouse=
set encoding=utf-8
set fileencoding=utf-8
set noshowmode     " Hide the mode (INSERT, NORMAL, etc
set number         " Show line number on left
set relativenumber " Show current line number, and the rest relative
" set linebreak      " Break lines, without breaking words
set autoread       " Automatically reload file if it has been changed outside of vim
set wildmenu       " Cmd-line completion on enhanced mode
set completeopt+=noinsert
set wildignore=*.o,*.pyc " Ignore these files
set wildmode=list:full,full
set ruler
set cursorline
set cmdheight=1
set hidden        " Hide buffer
set backspace=eol,start,indent
set whichwrap+=<,>
set ignorecase
set smartcase
set hlsearch  " Highlight search
set incsearch " Incremental search
set lazyredraw " Wait for certain events to redraw the screen
set magic
set showmatch
set noerrorbells
set novisualbell
"set t_vb=
set tm=500
set foldcolumn=1
set nowb
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2
"set textwidth=80
set autoindent
set si
set wrap
set laststatus=2
set conceallevel=2

" Spelling
"setlocal spell
"set spelllang=en_us,pt_br

" Enable syntax highlight
syntax enable

" Clipboard
let &clipboard=has('unnamedplus') ? 'unnamedplus' : 'unnamed'
set clipboard+=unnamedplus

" Backup
set backupdir=~/.local/share/vim/backup
set noswapfile
set nowritebackup
set nobackup
if has('persistent_undo')
  silent call system('mkdir -p ~/.local/share/vim/undo')
  set undodir=~/.local/share/vim/undo
  set undofile
  set undolevels=3000
  set undoreload=3000
endif

filetype plugin indent on
set t_Co=256
set background=dark
colorscheme gruvbox
