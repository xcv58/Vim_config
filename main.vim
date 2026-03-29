" "set default to Dropbox
" let dropbox_home = $HOME . '/Dropbox'
" if isdirectory(dropbox_home)
"   cd ~/Dropbox
" endif

" set working directory to current file's directory
augroup VimrcLocalCwd
  autocmd!
  autocmd BufReadPost,BufNewFile * if &buftype ==# '' && expand('%:p:h') !=# '' | silent! lcd %:p:h | endif
augroup END

" autoread when file changes
se autoread

" load plug
so $HOME/.vim/plug.vim

" Keybind
so $HOME/.vim/keybind.vim

" airline
so $HOME/.vim/airline.vim

" Display settings
so $HOME/.vim/display.vim

" Detect start type by file size
so $HOME/.vim/start_type.vim

" fzf configuration (replaces ctrlp)
so $HOME/.vim/fzf.vim

" which-key configuration
so $HOME/.vim/whichkey.vim

" glow markdown preview
so $HOME/.vim/glow.vim
