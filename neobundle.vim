 " Note: Skip initialization for vim-tiny or vim-small.
 if !1 | finish | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!
 NeoBundle 'nathanaelkane/vim-indent-guides'
 NeoBundle 'jcf/vim-latex'
 NeoBundle 'ervandew/supertab'
 NeoBundle 'scrooloose/nerdtree'
 NeoBundle 'The-NERD-Commenter'
 NeoBundle 'vim-scripts/taglist.vim'
 NeoBundle 'vim-scripts/L9'
 NeoBundle 'bling/vim-airline'
 NeoBundle 'kien/ctrlp.vim'
 NeoBundle 'altercation/vim-colors-solarized'
 NeoBundle 'airblade/vim-gitgutter'
 NeoBundle 'vim-scripts/YankRing'
 NeoBundle 'Valloric/YouCompleteMe'

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck
