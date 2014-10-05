" maximum number of recently opened files in cache
let g:ctrlp_mruf_max = 1024

" disable caching
let g:ctrlp_use_caching = 1

ignore some dir or files
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\libs$\|\gen$\|\bin$\|\.settings\|\tmp$',
      \ 'file': '\.apk\|\.d\|\.class\|\.cache\|\.jar\|.csproj\|\.swp\|\.zip\|\.so\|\.7z\|\.png\|\.pdf\|\.rar\|\.jpg\|\.ap_$'
      \ }

se wildignore+=*/*.prop,*/.hg/*,*/.svn/,*/.git/

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
