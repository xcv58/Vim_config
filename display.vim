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

"show matching bracets
se showmatch

"Don't break a word
se linebreak

" Auto indent
se autoindent

" C indent
se cindent

" Smart indent
se smartindent

" No tabs, all tab characters are 2 space characters
se tabstop=4
se shiftwidth=4
se softtabstop=4
se expandtab

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
