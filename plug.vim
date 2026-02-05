call plug#begin('~/.vim/plugged')

" Status line
Plug 'vim-airline/vim-airline'

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Completion
Plug 'ervandew/supertab'

" Editing enhancements
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" File explorer (lazy-loaded)
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" Fuzzy finder (replaces CtrlP)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Colors and syntax
Plug 'altercation/vim-colors-solarized'
Plug 'sheerun/vim-polyglot'

" Utilities
Plug 'djoshea/vim-autoread'

" Linting
Plug 'dense-analysis/ale'

" Which-key for keybinding help (lazy-loaded)
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

call plug#end()
