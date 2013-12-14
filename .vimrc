"pathogen
call pathogen#infect()

"设置字符集
set encoding=UTF-8
"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8
set ambiwidth=double
set fileencodings=utf-8,gb18030,gb2312,gbk
"se fileencoding=utf-8,gb18030,gbk,utf-16,ucs-bom,big5,latin1
"set fileencodings=utf-8,ucs-bom,cp936,gb18030,utf-16,big5,gbk,ucs-bom,cp936,latin1

"设置颜色、字体
set t_Co=256
colorscheme elflord
se guifont=Menlo\ Regular:h28
se transparency=30

"backup tmp directory
"set nobackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"set a long history
se history=65536

"useful file/command completion
se wildmenu
se wildmode=list:longest

"打开文件类型检测功能
filetype plugin indent on

"缩进
"auto indent
se autoindent
"c indent
se cindent
"smart indent
se smartindent

"show tab line
"se list lcs=tab:\/.
"se list lcs=tab:\/-
"se list lcs=tab:+-,trail:-

"tablength = 4
se ts=2 sw=2

"au FileType * IndentGuidesEnable
"let g:indent_guides_start_level=2
"let g:indent_guides_auto_colors=1
"let g:indent_guides_guide_size=1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4


"enable fold
se foldenable
se foldnestmax=1
se foldmethod=syntax



"设置当前行高亮，cursorline
"se cul

"将当前光标下的列高亮
"se cuc

"搜索相关
se hlsearch
se incsearch
se smartcase
se ignorecase
se wrapscan
"enable magic matching
set magic

"show matching bracets
set showmatch

"启用语法高亮
"Move to vimrcAutoView
"syntax enable
"syntax on

"不显示右边滚动条
set guioptions-=r

"显示文件名: 总行数, 总的字符数
" set statusline=[%F]%y%r%m%*%=[L:%l/%L,C:%c][%p%%]
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
"" set statusline=
"" set statusline+=%<\                       " cut at start
"" set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
"" set statusline+=%-40f\                    " path
"" set statusline+=%=%1*%y%*%*\              " file type
"" set statusline+=%0((%l,%c)%)\            " line and column
"" set statusline+=[%P]                        " percentage of file

"" set statusline=   " clear the statusline for when vimrc is reloaded
"" set statusline+=%-3.3n\                      " buffer number
"" set statusline+=%t\                          " file name
"" set statusline+=%h%m%r%w                     " flags
"" set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
"" set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
"" set statusline+=%{&fileformat}]              " file format
"" set statusline+=%=                           " right align
"" set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
"" set statusline+=%b,0x%-8B\                   " current char
"" set statusline+=%2*%-10.(%l,%c%V%)%*\ %<%P        " offset

"statusline setup
set statusline=
"set statusline+=%-2.3n\                      " buffer number
"set statusline=%#identifier#
set statusline+=%t    "tail of the filename
"set statusline+=%*

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h\      "help file flag
set statusline+=%y      "filetype

"read only flag
set statusline+=%#error#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#error#
set statusline+=%m
set statusline+=%*

" set statusline+=%{fugitive#statusline()}

""display a warning if &et is wrong, or we have mixed-indenting
"set statusline+=%#error#
"set statusline+=%{StatuslineTabWarning()}
"set statusline+=%*

"set statusline+=%{StatuslineTrailingSpaceWarning()}

"set statusline+=%{StatuslineLongLineWarning()}

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%b,0x%-6B\                   " current char
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%#identifier#
"" set statusline+=%2*%-10.(%l,%c%V%)%*\ %<%P        " offset
set statusline+=%-3.(%l,%c%V%)  "cursor line lines
" set statusline+=%c    "cursor column
" set statusline+=%l,   "cursor line lines
set statusline+=%*
set statusline+=\ %L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
	if !exists("b:statusline_trailing_space_warning")

		if !&modifiable
			let b:statusline_trailing_space_warning = ''
			return b:statusline_trailing_space_warning
		endif

		if search('\s\+$', 'nw') != 0
			let b:statusline_trailing_space_warning = '[\s]'
		else
			let b:statusline_trailing_space_warning = ''
		endif
	endif
	return b:statusline_trailing_space_warning
endfunction


"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
	let name = synIDattr(synID(line('.'),col('.'),1),'name')
	if name == ''
		return ''
	else
		return '[' . name . ']'
	endif
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
	if !exists("b:statusline_tab_warning")
		let b:statusline_tab_warning = ''

		if !&modifiable
			return b:statusline_tab_warning
		endif

		let tabs = search('^\t', 'nw') != 0

		"find spaces that arent used as alignment in the first indent column
		let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

		if tabs && spaces
			let b:statusline_tab_warning =  '[mixed-indenting]'
		elseif (spaces && !&et) || (tabs && &et)
			let b:statusline_tab_warning = '[&et]'
		endif
	endif
	return b:statusline_tab_warning
endfunction

"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
	if !exists("b:statusline_long_line_warning")

		if !&modifiable
			let b:statusline_long_line_warning = ''
			return b:statusline_long_line_warning
		endif

		let long_line_lens = s:LongLines()

		if len(long_line_lens) > 0
			let b:statusline_long_line_warning = "[" .
						\ '#' . len(long_line_lens) . "," .
						\ 'm' . s:Median(long_line_lens) . "," .
						\ '$' . max(long_line_lens) . "]"
		else
			let b:statusline_long_line_warning = ""
		endif
	endif
	return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
	let threshold = (&tw ? &tw : 80)
	let spaces = repeat(" ", &ts)
	let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
	return filter(line_lens, 'v:val > threshold')
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
	let nums = sort(a:nums)
	let l = len(nums)

	if l % 2 == 1
		let i = (l-1) / 2
		return nums[i]
	else
		return (nums[l/2] + nums[(l/2)-1]) / 2
	endif
endfunction


" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"Don't break a word
se linebreak

"change default viewdir 
se viewdir=~/.vim-view

"automatically load fold infomation
"Do not do something when open a large file
"autocmd BufWinLeave *.* mkview!
"autocmd BufWinEnter *.* silent loadview
" Large files are > 10M
" Set options:
" eventignore+=FileType (no syntax highlighting etc
" assumes FileType always on)
" noswapfile (save copy of file)
" bufhidden=unload (save memory when other file is viewed)
" buftype=nowritefile (is read-only)
" undolevels=-1 (no undo possible)
let g:LargeFile = 1024 * 1024 * 3
"let g:LargeFile = 1024 * 1024 * 10
let g:skipview_files = [
			\ '[EXAMPLE PLUGIN BUFFER]'
			\ ]
function! MakeViewCheck()
	if has('quickfix') && &buftype =~ 'nofile'
		" Buffer is marked as not a file
		return 0
	endif
	if empty(glob(expand('%:p')))
		" File does not exist on disk
		return 0
	endif
	if len($TEMP) && expand('%:p:h') == $TEMP
		" We're in a temp dir
		return 0
	endif
	if len($TMP) && expand('%:p:h') == $TMP
		" Also in temp dir
		return 0
	endif
	if index(g:skipview_files, expand('%')) >= 0
		" File is in skip list
		return 0
	endif
	" autocmd BufReadPre * let f=expand("<afile>") |
	if getfsize(expand("<afile>")) > g:LargeFile
		" File is too large
		return 0
	endif
	return 1
endfunction

 function DefaultStartup()
	 se incsearch
 	silent loadview
 	if &ft != ''
 		call SyntaxOn()
 	else 
 		call SyntaxOff()
 	endif 
 endfunction

 function MiniStartup()
	 se nonu
	 "se noincsearch
	 call SyntaxOff()
 endfunction

function SyntaxOn()
	if has("gui_running")
		se syntax=on
	else
		syntax on
	endif
endfunction

function SyntaxOff()
	if has("gui_running")
		se syntax=off
	else
		syntax off
	endif
endfunction

augroup vimrcAutoView
	autocmd!
	" Autosave & Load Views.
	autocmd BufWritePost,BufLeave,WinLeave,BufWinLeave ?* if MakeViewCheck() | mkview | endif
	"autocmd BufWinEnter ?* if MakeViewCheck() | silent loadview | se syntax=on| se fileencodings=utf-8,ucs-bom,cp936,gb18030,utf-16,big5,gbk,ucs-bom,cp936,latin1 | else | se nonu | se syntax=off | endif
	autocmd BufWinEnter ?* if MakeViewCheck() | call DefaultStartup() | else | call MiniStartup() | endif
	"autocmd BufWinEnter ?* if MakeViewCheck() | call DefaultStartup() | else | se nonu | se syntax=off | endif
	"set fileencodings=utf-8,ucs-bom,cp936,gb18030,utf-16,big5,gbk,ucs-bom,cp936,latin1
	"		autocmd BufWinEnter ?* if MakeViewCheck() | silent loadview | se nu | se syntax=on | else | se nonu | se syntax=off | endif
	augroup end


		"折叠的颜色设置
		highlight Folded guibg=grey guifg=blue
		highlight FoldColumn guibg=darkgrey guifg=white

		"修改切换标签快捷键
		if has("gui_macvim")
			" Press Ctrl-R to redo
			noremap <C-R> :redo<CR>

			" Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
			" the right side. Ctrl-Shift-Tab goes the other way.
			noremap <C-Tab> :tabnext<CR>
			noremap <C-S-Tab> :tabprev<CR>

			" Switch to specific tab numbers with Command-number
			noremap <D-1> :tabn 1<CR>
			noremap <D-2> :tabn 2<CR>
			noremap <D-3> :tabn 3<CR>
			noremap <D-4> :tabn 4<CR>
			noremap <D-5> :tabn 5<CR>
			noremap <D-6> :tabn 6<CR>
			noremap <D-7> :tabn 7<CR>
			noremap <D-8> :tabn 8<CR>
			noremap <D-9> :tabn 9<CR>
			" Command-0 goes to the last tab
			noremap <D-0> :tablast<CR>
		endif



		""设置正确的菜单编码
		"source $VIMRUNTIME/delmenu.vim
		"source $VIMRUNTIME/menu.vim

		""启动后最大化
		"au GUIEnter * simalt ~x

		""输入法
		""if has('multi_byte_ime')
		""            highlight Cursor guibg=Green guifg=NONE


		"VIM-LaTeX
		"For mac only
		let g:Tex_ViewRule_pdf = 'Preview'
		" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
		" OPTIONAL: This enables automatic indentation as you type.
		"filetype plugin on
		"filetype indent on

		" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
		" can be called correctly.
		set shellslash

		" IMPORTANT: grep will sometimes skip displaying the file name if you
		" search in a singe file. This will confuse Latex-Suite. Set your grep
		" program to always generate a file-name.
		set grepprg=grep\ -nH\ $*


		" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
		" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
		" The following changes the default filetype back to 'tex':
		let g:tex_flavor='latex'

		" this is mostly a matter of taste. but LaTeX looks good with just a bit
		" of indentation.
		set sw=2
		" TIP: if you write your \label's as \label{fig:something}, then if you
		" type in \ref{fig: and press <C-n> you will automatically cycle through
		" all the figure labels. Very useful!
		"set iskeyword+=:

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

		helptags ~/.vim/bundle/vim-latex-1.8.23-20130116.788-git2ef9956/doc

