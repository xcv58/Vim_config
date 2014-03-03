" vim -u test/vimrc
se nocompatible
se nowrap
filetype off                  " required!
let root = '~/.vim/bundle'
let src = 'http://github.com/gmarik/vundle.git' 

" let src = '~/.vim/bundle/vundle/.git' 

" Vundle Options
" let g:vundle_default_git_proto = 'git'

if !isdirectory(expand(root, 1).'/vundle')
  exec '!git clone '.src.' '.root.'/vundle'
endif

runtime macros/matchit.vim

exec 'se rtp+='.root.'/vundle'

call vundle#rc(root)

" se rtp+=~/.vim/bundle/vundle/
" call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'jcf/vim-latex'
Bundle 'Valloric/YouCompleteMe'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdtree'
Bundle 'The-NERD-Commenter'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/L9'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'jistr/vim-nerdtree-tabs'

"" original repos on GitHub
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
"" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"" non-GitHub repos
"Bundle 'git://git.wincent.com/command-t.git'
"" Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
"
"" ...
""
"" Brief help
"" :BundleList          - list configured bundles
"" :BundleInstall(!)    - install (update) bundles
"" :BundleSearch(!) foo - search (or refresh cache first) for foo
"" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
""
"" see :h vundle for more details or wiki for FAQ
"" NOTE: comments after Bundle commands are not allowed.
