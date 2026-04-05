" Leader
let mapleader="\\"

" Quick escape with jk
inoremap jk <Esc>

" Quick save
nnoremap <Leader>s :w<CR>

" macOS clipboard fallback for visual selections
if has('macunix') && executable('pbcopy')
  function! s:CopyVisualSelectionToMacClipboard() abort
    let l:save_z = getreg('z')
    let l:save_ztype = getregtype('z')

    silent normal! gv"zy
    let l:text = getreg('z')

    call setreg('z', l:save_z, l:save_ztype)
    call system('pbcopy', l:text)

    if v:shell_error != 0
      echohl WarningMsg
      echom 'pbcopy failed'
      echohl None
    endif
  endfunction

  xnoremap <silent> <Leader>y :<C-u>call <SID>CopyVisualSelectionToMacClipboard()<CR>

  if has('gui_macvim')
    xnoremap <silent> <D-c> :<C-u>call <SID>CopyVisualSelectionToMacClipboard()<CR>
  endif
endif

" Buffers
nnoremap <Leader>d :bn<cr>
nnoremap <Leader>a :bp<cr>
nnoremap <Leader>w :bd<cr>
" Alternative buffer navigation with Ctrl
nnoremap <C-l> :bn<cr>
nnoremap <C-h> :bp<cr>

" Window navigation with Ctrl
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" NERDTree toggle
nnoremap <Leader>n :NERDTreeToggle<CR>

" Markdown preview in browser
augroup VimrcMarkdownPreview
  autocmd!
  autocmd FileType markdown nnoremap <buffer> <Leader>p :MarkdownPreviewToggle<CR>
augroup END

" Which-key
nnoremap <silent> <Leader> :WhichKey '\'<CR>

" Toggle transparency (MacVim only)
if has('gui_macvim')
  nnoremap <Leader>t :call TransparencyToggle()<cr>
  nnoremap <D-u> :call TransparencyToggle()<cr>

  function! TransparencyToggle()
    if &transparency == 0
      set transparency=10
    else
      set transparency=0
    endif
  endfunction

  " Tab switching with Ctrl-Tab
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  noremap <D-0> :tablast<CR>
endif

" For HHKB use C-p to search in command line
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

" Press Ctrl-R to redo
noremap <C-R> :redo<CR>
