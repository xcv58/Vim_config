
"VIM-LaTeX
"For mac only
let g:Tex_ViewRule_pdf = 'Preview'
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
" OPTIONAL: This enables automatic indentation as you type.
"filetype plugin on
"filetype indent on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
se shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
se grepprg=grep\ -nH\ $*


" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
se sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
"se iskeyword+=:

""autocmd FileType tex map <leader><leader><leader> :w<cr><plug>Tex_Compile
autocmd FileType * map <leader><leader><leader> :call ThreeLeader()<cr>
function! ThreeLeader()
	" Don't strip on these filetypes
	:w
	if &ft == 'tex'
		:call Tex_RunLaTeX()
		"<leader>ll
		"			<plug>Tex_Compile
	endif
endfunction
"<plug>Tex_View
"imap <D-L> <Plug>IMAP_JumpForward
"imap <D-L> <Plug>Tex_MathBF                  <Alt-B>
"imap <-> <Plug>Tex_MathCal                 <Alt-C>
autocmd FileType tex imap <C-L> <plug>Tex_LeftRight
"imap <-> <Plug>Tex_InsertItemOnThisLine    <Alt-I>
if isdirectory(expand(root, 1).'/vim-latex/doc')
	helptags ~/.vim/bundle/vim-latex/doc
endif
