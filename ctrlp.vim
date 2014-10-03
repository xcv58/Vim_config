" maximum number of recently opened files in cache
let g:ctrlp_mruf_max = 100

" disable caching
let g:ctrlp_use_caching = 0

" ignore some dir or files
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\.git$\|\libs$\|\gen$\|\bin$\|\.settings\|\tmp$',
			\ 'file': '\.apk\|\.d\|\.class\|\.cache\|\.jar\|.csproj\|\.swp\|\.zip\|\.so\|\.ap_$'
			\ }

set wildignore+=*/*.prop,*/.hg/*,*/.svn/,*/.git/
