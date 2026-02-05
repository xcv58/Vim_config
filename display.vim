" Color, font
set t_Co=256

" Enable 24-bit color in modern terminals
if has('termguicolors')
  set termguicolors
endif

set guifont=Inconsolata:h18

" Colorscheme
if has('gui_running')
  set transparency=10
  set background=dark
  colorscheme solarized
else
  colorscheme elflord
endif

" Don't show scroll bar
set guioptions-=r

" Color for fold
highlight Folded guibg=grey guifg=blue
highlight FoldColumn guibg=darkgrey guifg=white

" Enable filetype detection
filetype plugin indent on

" Show tab characters
set list lcs=tab:\ \ ,

" Line numbers
set number
