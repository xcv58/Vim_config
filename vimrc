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

"change default viewdir 
se viewdir=$HOME/.vim-view

" set a long history
se history=65536

"useful file/command completion
se wildmenu
se wildmode=list:longest

"enable fold
se foldenable
se foldnestmax=3
se foldmethod=syntax

" Search related
se hlsearch
se smartcase
se ignorecase
se wrapscan
se magic

" Vundle
so $HOME/.vim/vundle.vim

" Display settings
so $HOME/.vim/display.vim
so $HOME/.vim/status_line.vim

" Detect start type by file size
so $HOME/.vim/start_type.vim

" For LaTeX
so $HOME/.vim/latex.vim

" For Keybind
so $HOME/.vim/Keybind.vim
