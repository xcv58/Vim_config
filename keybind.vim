" Leader
let mapleader="\\"

" Buffers
map <Leader>d :bn<cr>
map <C-l> :bn<cr>
map <Leader>a :bp<cr>
map <C-h> :bp<cr>
map <Leader>w :bd<cr>

" For HHKB use C-p to search in command line
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

" Keybind for switch tabs
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
