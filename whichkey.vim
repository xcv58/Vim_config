" which-key configuration

" Timeout for which-key popup
set timeoutlen=500

" Define prefix dictionary
let g:which_key_map = {}

" Buffer operations
let g:which_key_map.a = 'previous buffer'
let g:which_key_map.d = 'next buffer'
let g:which_key_map.w = 'delete buffer'

" File operations
let g:which_key_map.s = 'save file'
let g:which_key_map.n = 'toggle NERDTree'

" fzf operations
let g:which_key_map.f = 'find files (fzf)'
let g:which_key_map.b = 'find buffers (fzf)'
let g:which_key_map.g = 'grep with ripgrep'
let g:which_key_map.m = 'recent files (MRU)'

" MacVim only
if has('gui_macvim')
  let g:which_key_map.t = 'toggle transparency'
endif

" Register the dictionary
autocmd! User vim-which-key call which_key#register('\', 'g:which_key_map')

" Additional keybindings not shown in which-key (for reference):
" jk (insert) = Escape to normal mode
" Ctrl-p (normal) = Find files with fzf
" Ctrl-h/l (normal) = Previous/next buffer
" Ctrl-j/k (normal) = Window down/up
" Ctrl-p/n/b/f (command) = History up/down, cursor left/right
