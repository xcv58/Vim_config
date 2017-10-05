"automatically load fold infomation

"Do not do something when open a large file
"autocmd BufWinLeave *.* mkview!
"autocmd BufWinEnter *.* silent loadview
" Large files are > 10M
" Set options:
" eventignore+=FileType (no syntax highlighting etc
" assumes FileType always on)
" noswapfile (save copy of file)
" bufhidden=unload (save memory when other file is viewed)
" buftype=nowritefile (is read-only)
" undolevels=-1 (no undo possible)
let g:LargeFile = 1024 * 1024 * 32
"let g:LargeFile = 1024 * 1024 * 10
let g:skipview_files = [ '[EXAMPLE PLUGIN BUFFER]' ]
function! MakeViewCheck()
  if has('quickfix') && &buftype =~ 'nofile'
    " Buffer is marked as not a file
    return 0
  endif
  if empty(glob(expand('%:p')))
    " File does not exist on disk
    return 0
  endif
  if len($TEMP) && expand('%:p:h') == $TEMP
    " We're in a temp dir
    return 0
  endif
  if len($TMP) && expand('%:p:h') == $TMP
    " Also in temp dir
    return 0
  endif
  if index(g:skipview_files, expand('%')) >= 0
    " File is in skip list
    return 0
  endif
  " autocmd BufReadPre * let f=expand("<afile>") |
  if getfsize(expand("<afile>")) > g:LargeFile
    " File is too large
    return 0
  endif
  return 1
endfunction

function! DefaultStartup()
  silent loadview
  if &ft != ''
    call SyntaxOn()
  "else
  "  call SyntaxOff()
  endif
  se incsearch
  se nu
endfunction

function! MiniStartup()
  se nonu
  "se noincsearch
  call SyntaxOff()
endfunction

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

augroup vimrcAutoView
  autocmd!
  " Autosave & Load Views.
  autocmd BufWritePost,BufLeave,WinLeave,BufWinLeave ?* if MakeViewCheck() | mkview | endif
  "autocmd BufWinEnter ?* if MakeViewCheck() | silent loadview | se syntax=on| se fileencodings=utf-8,ucs-bom,cp936,gb18030,utf-16,big5,gbk,ucs-bom,cp936,latin1 | else | se nonu | se syntax=off | endif
  autocmd BufWinEnter ?* if MakeViewCheck() | call DefaultStartup() | else | call MiniStartup() | endif
    "autocmd BufWinEnter ?* if MakeViewCheck() | call DefaultStartup() | else | se nonu | se syntax=off | endif
    "set fileencodings=utf-8,ucs-bom,cp936,gb18030,utf-16,big5,gbk,ucs-bom,cp936,latin1
    "    autocmd BufWinEnter ?* if MakeViewCheck() | silent loadview | se nu | se syntax=on | else | se nonu | se syntax=off | endif
    augroup end
