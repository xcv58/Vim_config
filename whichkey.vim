" which-key configuration

" Timeout for which-key popup
set timeoutlen=500

" Define prefix dictionary
let g:which_key_map = {}

let g:which_key_map.a = 'previous buffer'
let g:which_key_map.d = 'next buffer'
let g:which_key_map.w = 'delete buffer'
let g:which_key_map.s = 'save file'
let g:which_key_map.t = 'toggle transparency'
let g:which_key_map.n = 'toggle NERDTree'
let g:which_key_map.f = 'find files'
let g:which_key_map.b = 'find buffers'
let g:which_key_map.g = 'grep (ripgrep)'
let g:which_key_map.m = 'recent files'
let g:which_key_map.h = 'window left'
let g:which_key_map.j = 'window down'
let g:which_key_map.k = 'window up'
let g:which_key_map.l = 'window right'

" Register the dictionary
autocmd! User vim-which-key call which_key#register('\', 'g:which_key_map')
