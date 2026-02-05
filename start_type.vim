" Automatic view saving/loading and large file handling

" Large file threshold (matches vimrc)
let g:LargeFile = 1024 * 1024  " 1MB

let g:skipview_files = ['[EXAMPLE PLUGIN BUFFER]']

function! MakeViewCheck()
  if has('quickfix') && &buftype =~ 'nofile'
    return 0
  endif
  if empty(glob(expand('%:p')))
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
  return 1
endfunction

function! DefaultStartup()
  silent! loadview
  if &ft != ''
    call SyntaxOn()
  endif
  set incsearch
  set number
endfunction

function! MiniStartup()
  set nonumber
  call SyntaxOff()
endfunction

augroup vimrcAutoView
  autocmd!
  autocmd BufWritePost,BufLeave,WinLeave,BufWinLeave ?* if MakeViewCheck() | mkview | endif
  autocmd BufWinEnter ?* if MakeViewCheck() | call DefaultStartup() | else | call MiniStartup() | endif
augroup END
