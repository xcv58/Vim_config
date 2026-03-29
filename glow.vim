" markdown-preview.nvim custom CSS
let g:mkdp_markdown_css = expand('~/.vim/markdown-preview.css')

" Glow markdown preview (https://github.com/charmbracelet/glow)
let s:glow_bin = ''
for s:candidate in ['glow', '/opt/homebrew/bin/glow', '/usr/local/bin/glow']
  if executable(s:candidate)
    let s:glow_bin = s:candidate
    break
  endif
endfor

if !empty(s:glow_bin)
  command! Glow call s:GlowPreview()

  function! s:GlowPreview()
    if &filetype !=# 'markdown'
      echo 'Glow: not a markdown file'
      return
    endif
    call term_start([g:glow_bin, '-p', expand('%:p')], {'vertical': 1})
  endfunction

  let g:glow_bin = s:glow_bin

  augroup VimrcGlowPreview
    autocmd!
    autocmd FileType markdown nnoremap <buffer> <Leader>P :Glow<CR>
  augroup END
endif
