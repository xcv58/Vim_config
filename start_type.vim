" Automatic view saving/loading and large file handling

let g:skipview_files = ['[EXAMPLE PLUGIN BUFFER]']

function! s:IsLargeFile() abort
  let l:path = expand('%:p')
  if empty(l:path) || !filereadable(l:path)
    return 0
  endif
  return getfsize(l:path) > g:large_file_threshold
endfunction

function! MakeViewCheck() abort
  if &buftype !=# ''
    return 0
  endif
  if len($TEMP) && expand('%:p:h') == $TEMP
    return 0
  endif
  if len($TMP) && expand('%:p:h') == $TMP
    return 0
  endif
  if index(g:skipview_files, expand('%')) >= 0
    return 0
  endif
  if s:IsLargeFile()
    return 0
  endif
  return 1
endfunction

function! DefaultStartup() abort
  if s:IsLargeFile()
    call MiniStartup()
    return
  endif
  silent! loadview
  if !exists('g:syntax_on') || &syntax ==# ''
    call SyntaxOn()
  endif
  setlocal incsearch
  setlocal number
endfunction

function! MiniStartup() abort
  setlocal nonumber
  call SyntaxOff()
endfunction

augroup vimrcAutoView
  autocmd!
  autocmd BufWinLeave ?* if MakeViewCheck() | silent! mkview | endif
  autocmd BufWinEnter ?* if MakeViewCheck() | call DefaultStartup() | else | call MiniStartup() | endif
augroup END
