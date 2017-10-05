" "set default to Dropbox
" let dropbox_home = $HOME . '/Dropbox'
" if isdirectory(dropbox_home)
"   cd ~/Dropbox
" endif

" set working directory to current file's directory
au BufEnter * silent! lcd %:p:h

" autoread when file changes
se autoread

" load plug
so $HOME/.vim/plug.vim

" set filetype plugin on after plug, because plug will set filetype off
filetype plugin on

" Keybind
so $HOME/.vim/keybind.vim

" airline
so $HOME/.vim/airline.vim

" Display settings
so $HOME/.vim/display.vim

" Detect start type by file size
so $HOME/.vim/start_type.vim
