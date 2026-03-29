call plug#begin('~/.vim/plugged')

" Status line
Plug 'vim-airline/vim-airline'

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Completion
Plug 'ervandew/supertab'

" Editing enhancements
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" File explorer (lazy-loaded)
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" Fuzzy finder (replaces CtrlP)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Markdown browser preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': 'markdown' }

" Colors
Plug 'altercation/vim-colors-solarized'

" Linting (lazy-loaded - enable on first insert)
Plug 'dense-analysis/ale', { 'on': [] }

" Which-key for keybinding help (lazy-loaded)
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

call plug#end()

" Lazy load ale on first insert
augroup LazyLoadPlugins
  autocmd!
  autocmd InsertEnter * call plug#load('ale')
augroup END
