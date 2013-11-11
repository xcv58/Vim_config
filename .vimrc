"pathogen
call pathogen#infect()

"设置字符集
set encoding=UTF-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set ambiwidth=double
set fileencodings=utf-8,gb2312
"se fileencoding=utf-8,gb18030,gbk,utf-16,ucs-bom,big5,latin1
"set fileencodings=utf-8,ucs-bom,cp936,gb18030,utf-16,big5,gbk,ucs-bom,cp936,latin1

"设置颜色、字体
set t_Co=256
colorscheme elflord
se guifont=Menlo\ Regular:h28

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
set autoindent
"c indent
set cindent
"smart indent
set smartindent

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
set foldenable
set foldnestmax=1
set foldmethod=syntax


"显示行号
"se nu
"se nonu

"设置当前行高亮，cursorline
"se cul

"将当前光标下的列高亮
"se cuc

"搜索相关
set hlsearch
set incsearch
set smartcase
set ignorecase
set wrapscan
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
set statusline=[%F]%y%r%m%*%=[L:%l/%L,C:%c][%p%%]
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"Don't break a word
set linebreak

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
let g:LargeFile = 1024 * 1024 * 30
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
"function DefaultStartup()
"	silent loadview
"	if &ft != ''
"		se syntax=on 
"	else 
"		se syntax=off 
"	endif 
"	se nonu 
"	se syntax=off 
"endfunction
augroup vimrcAutoView
    autocmd!
    " Autosave & Load Views.
    autocmd BufWritePost,BufLeave,WinLeave,BufWinLeave ?* if MakeViewCheck() | mkview | endif
		"autocmd BufWinEnter ?* if MakeViewCheck() | silent loadview | se syntax=on| se fileencodings=utf-8,ucs-bom,cp936,gb18030,utf-16,big5,gbk,ucs-bom,cp936,latin1 | else | se nonu | se syntax=off | endif
		autocmd BufWinEnter ?* if MakeViewCheck() |
					\	silent loadview |
					\	if &ft != '' |
					\		se syntax=on |
					\	else |
					\		se syntax=off |
					\	endif |
					\else |
					\	se nonu |
					\	se syntax=off |
					\endif
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


