" Encode
se encoding=UTF-8
"se langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8
se ambiwidth=double
se fileencodings=utf-8,gb18030,gb2312,gbk
"se fileencoding=utf-8,gb18030,gbk,utf-16,ucs-bom,big5,latin1
"se fileencodings=utf-8,ucs-bom,cp936,gb18030,utf-16,big5,gbk,ucs-bom,cp936,latin1

"backup tmp directory
se backupdir=$HOME/.vim-tmp,$HOME/.tmp,$HOME/tmp,/var/tmp,/tmp
se directory=$HOME/.vim-tmp,$HOME/.tmp,$HOME/tmp,/var/tmp,/tmp

"set default to Dropbox
let dropbox_home = $HOME . '/Dropbox'
if isdirectory(dropbox_home)
  cd ~/Dropbox
endif

"change default viewdir
se viewdir=$HOME/.vim-view

" set a long history
se history=65536

"useful file/command completion
se wildmenu
se wildmode=list:longest,full

"enable fold
se foldenable
se foldnestmax=3
se foldmethod=syntax
" disable auto folding
se foldlevelstart=99

" Search related
se hlsearch
se smartcase
se ignorecase
se wrapscan
se magic

" set working directory to current file's directory
au BufEnter * silent! lcd %:p:h

" autoread when file changes
se autoread

" set root for seperate config files
let root = '~/.vim/bundle'

" Vundle
so $HOME/.vim/vundle.vim

" ctrlp
so $HOME/.vim/ctrlp.vim

" airline
so $HOME/.vim/airline.vim

" Display settings
so $HOME/.vim/display.vim
so $HOME/.vim/status_line.vim

" Detect start type by file size
so $HOME/.vim/start_type.vim

"" For LaTeX
"so $HOME/.vim/latex.vim

" For Keybind
so $HOME/.vim/keybind.vim
