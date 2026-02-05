" Lightweight vim configuration for resource-constrained environments
" Usage: vim -u ~/.vim/lite.vim

so $HOME/.vim/base.vim

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
call plug#end()

filetype plugin on

" airline
so $HOME/.vim/airline.vim

colorscheme elflord
