so $HOME/.vim/base.vim

" filetype plugin on

call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'YankRing.vim'
Plug 'ervandew/supertab'
call plug#end()

" airline
so $HOME/.vim/airline.vim

colorscheme elflord

" Detect start type by file size
so $HOME/.vim/start_type.vim
