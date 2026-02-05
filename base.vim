" Encode
set encoding=UTF-8

set ambiwidth=double
set fileencodings=utf-8,gb18030,gb2312,gbk

" Backup tmp directory
set backupdir=$HOME/.vim-tmp,$HOME/.tmp,$HOME/tmp,/var/tmp,/tmp
set directory=$HOME/.vim-tmp,$HOME/.tmp,$HOME/tmp,/var/tmp,/tmp

" Change default viewdir
set viewdir=$HOME/.vim-view

" Set a long history
set history=10000

" Useful file/command completion
set wildmenu
set wildmode=longest,list

" Enable fold
set foldenable
set foldnestmax=3
set foldmethod=syntax

" Disable auto folding
set foldlevelstart=99

" Search related
set hlsearch
set smartcase
set ignorecase
set wrapscan
set magic

" Show matching brackets
set showmatch

" Don't break a word
set linebreak

" Smart indent (includes autoindent behavior)
set smartindent

" No tabs, all tab characters are 4 space characters
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Mac Clipboard
set clipboard=unnamed

" Undo persistence
set undofile
set undodir=$HOME/.vim-undo

" Create directories if needed
if !isdirectory($HOME . '/.vim-undo')
  silent! call mkdir($HOME . '/.vim-undo', 'p', 0700)
endif
if !isdirectory($HOME . '/.vim-tmp')
  silent! call mkdir($HOME . '/.vim-tmp', 'p', 0700)
endif
if !isdirectory($HOME . '/.vim-view')
  silent! call mkdir($HOME . '/.vim-view', 'p', 0700)
endif
