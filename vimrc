so $HOME/.vim/base.vim

function! s:Init()
  so $HOME/.vim/main.vim
endfunction

command! -nargs=0 -bar Init call s:Init()

function! s:Load()
  if getfsize(expand(@%)) > 1024 * 1024 " 1MB
    se laststatus=2
    se statusline=%f\ too\ big\ -\ Use\ :Init\ to\ load\ config
  else
    call s:Init()
  endif
endfunction

call s:Load()
