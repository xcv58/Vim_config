" Color, font
if has('termguicolors')
  set termguicolors
endif

" Colorscheme
if has('gui_running')
  set guifont=Menlo:h28
  if exists('+transparency')
    set transparency=0
  endif
  set background=dark
  colorscheme solarized
  " Don't show scroll bar
  set guioptions-=r
else
  colorscheme elflord
endif

" Color for fold
highlight Folded guibg=grey guifg=blue
highlight FoldColumn guibg=darkgrey guifg=white

" Show tab characters
set list lcs=tab:\ \ ,

" Line numbers
set number
