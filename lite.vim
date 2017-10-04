so $HOME/.vim/base.vim

call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'ervandew/supertab'
call plug#end()

" set filetype plugin on after plug, because plug will set filetype off
filetype plugin on

" airline
so $HOME/.vim/airline.vim

colorscheme elflord

" " Detect start type by file size
" so $HOME/.vim/start_type.vim
