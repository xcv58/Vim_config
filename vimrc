so $HOME/.vim/base.vim

function! SyntaxOn() abort
  syntax enable
endfunction

function! SyntaxOff() abort
  syntax off
endfunction

function! s:IsLargeFile(...) abort
  let l:path = a:0 ? a:1 : expand('%:p')
  if empty(l:path) || !filereadable(l:path)
    return 0
  endif
  return getfsize(l:path) > g:large_file_threshold
endfunction

function! LargeFileModeStatusline() abort
  return 'large file mode - undofile ' . (&l:undofile ? 'enabled' : 'disabled')
endfunction

function! s:Load() abort
  if s:IsLargeFile()
    set noundofile
    set nonumber
    call SyntaxOff()
    set laststatus=2
    set statusline=%f\ -\ %{LargeFileModeStatusline()}
  else
    so $HOME/.vim/main.vim
  endif
endfunction

call s:Load()
