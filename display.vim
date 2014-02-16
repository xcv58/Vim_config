" Color, font, etc.
se t_Co=256
colorscheme elflord
"se guifont=Menlo\ Regular:h28
se guifont=Monaco:h28
if has("gui_running")
	se transparency=30
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

"tablength = 4
se ts=2 sw=2

" Color for fold
highlight Folded guibg=grey guifg=blue
highlight FoldColumn guibg=darkgrey guifg=white

" Enable filetype detection
filetype plugin indent on

au FileType * IndentGuidesEnable
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=1
let g:indent_guides_guide_size=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" Show tab line
"se list lcs=tab:\/.
"se list lcs=tab:\/-
"se list lcs=tab:+-,trail:-

" Highlight line under cursor
"se cul

" Highlight column under cursor
"se cuc
