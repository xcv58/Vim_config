" For statusline
" se statusline=[%F]%y%r%m%*%=[L:%l/%L,C:%c][%p%%]
" se statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
"" se statusline=
"" se statusline+=%<\                       " cut at start
"" se statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
"" se statusline+=%-40f\                    " path
"" se statusline+=%=%1*%y%*%*\              " file type
"" se statusline+=%0((%l,%c)%)\            " line and column
"" se statusline+=[%P]                        " percentage of file

"" se statusline=   " clear the statusline for when vimrc is reloaded
"" se statusline+=%-3.3n\                      " buffer number
"" se statusline+=%t\                          " file name
"" se statusline+=%h%m%r%w                     " flags
"" se statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
"" se statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
"" se statusline+=%{&fileformat}]              " file format
"" se statusline+=%=                           " right align
"" se statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
"" se statusline+=%b,0x%-8B\                   " current char
"" se statusline+=%2*%-10.(%l,%c%V%)%*\ %<%P        " offset

"statusline setup
se statusline=
"se statusline+=%-2.3n\                      " buffer number
"se statusline=%#identifier#
se statusline+=%t    "tail of the filename
"se statusline+=%*

"display a warning if fileformat isnt unix
se statusline+=%#warningmsg#
se statusline+=%{&ff!='unix'?'['.&ff.']':''}
se statusline+=%*

"display a warning if file encoding isnt utf-8
se statusline+=%#warningmsg#
se statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
se statusline+=%*

se statusline+=%h\      "help file flag
se statusline+=%y      "filetype

"read only flag
se statusline+=%#error#
se statusline+=%r
se statusline+=%*

"modified flag
se statusline+=%#error#
se statusline+=%m
se statusline+=%*

" se statusline+=%{fugitive#statusline()}

""display a warning if &et is wrong, or we have mixed-indenting
"se statusline+=%#error#
"se statusline+=%{StatuslineTabWarning()}
"se statusline+=%*

"se statusline+=%{StatuslineTrailingSpaceWarning()}

"se statusline+=%{StatuslineLongLineWarning()}

"se statusline+=%#warningmsg#
"se statusline+=%{SyntasticStatuslineFlag()}
"se statusline+=%*

"display a warning if &paste is se
se statusline+=%#error#
se statusline+=%{&paste?'[paste]':''}
se statusline+=%*

se statusline+=%=      "left/right separator
se statusline+=%b,0x%-6B\                   " current char
se statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
se statusline+=%#identifier#
"" se statusline+=%2*%-10.(%l,%c%V%)%*\ %<%P        " offset
se statusline+=%-3.(%l,%c%V%)  "cursor line lines
" se statusline+=%c    "cursor column
" se statusline+=%l,   "cursor line lines
se statusline+=%*
se statusline+=\ %L   "cursor line/total lines
se statusline+=\ %P    "percent through file
se laststatus=2

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
" se statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
