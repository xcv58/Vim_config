" Color, font
se t_Co=256
se guifont=Inconsolata:h28
"se guifont=Monaco:h28

" colorscheme
if has('gui_running')
    se transparency=10
    se background=dark
    colorscheme solarized
else
    colorscheme elflord
endif

" Don't show scroll bar
se guioptions-=r

" Color for fold
highlight Folded guibg=grey guifg=blue
highlight FoldColumn guibg=darkgrey guifg=white

" Enable filetype detection
filetype plugin indent on

" Show tab line
" se list lcs=tab:\/.
" se list lcs=tab:\/-
" se list lcs=tab:+-,trail:-
" set listchars=tab:▸\ ,eol:¬
se list lcs=tab:\ \ ,

" Highlight line under cursor
"se cul

" Highlight column under cursor
"se cuc
