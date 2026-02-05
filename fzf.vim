" fzf.vim configuration

" Use ripgrep if available, fallback to ag
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
elseif executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag -l --nocolor -g ""'
endif

" Keybindings
nnoremap <C-p> :Files<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>g :Rg<CR>
nnoremap <Leader>m :History<CR>

" Layout
let g:fzf_layout = { 'down': '40%' }

" Colors to match colorscheme
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
