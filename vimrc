so $HOME/.vim/base.vim

function! SyntaxOn()
  if has("gui_running")
    se syntax=on
  else
    syntax on
  endif
endfunction

function! SyntaxOff()
  if has("gui_running")
    se syntax=off
  else
    syntax off
  endif
endfunction

function! s:Init()
  call SyntaxOn()
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
