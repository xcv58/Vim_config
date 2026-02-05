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

" Colors and syntax (lazy-loaded for performance)
Plug 'altercation/vim-colors-solarized'
Plug 'sheerun/vim-polyglot', { 'on': [] }

" Linting (lazy-loaded - enable on first insert)
Plug 'dense-analysis/ale', { 'on': [] }

" Which-key for keybinding help (lazy-loaded)
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

call plug#end()

" Lazy load polyglot and ale on first file read
augroup LazyLoadPlugins
  autocmd!
  autocmd BufReadPost * call plug#load('vim-polyglot')
  autocmd InsertEnter * call plug#load('ale')
augroup END
