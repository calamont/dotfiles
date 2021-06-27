let g:currentmode={
      \ 'n'  : 'N ',
      \ 'no' : 'N·Operator Pending ',
      \ 'v'  : 'V ',
      \ 'V'  : 'V·Line ',
      \ 'x22' : 'V·Block ',
      \ 's'  : 'Select ',
      \ 'S'  : 'S·Line ',
      \ 'x19' : 'S·Block ',
      \ 'i'  : 'I ',
      \ 'R'  : 'R ',
      \ 'Rv' : 'V·Replace ',
      \ 'c'  : 'Command ',
      \ 'cv' : 'Vim Ex ',
      \ 'ce' : 'Ex ',
      \ 'r'  : 'Prompt ',
      \ 'rm' : 'More ',
      \ 'r?' : 'Confirm ',
      \ '!'  : 'Shell ',
      \ 't'  : 'Terminal '
      \}

" hi User1 guibg=#323A4D guifg=#7D7C8F
hi User1 guibg=#FFFFFF guifg=#FFFFFF
hi User2 guifg=255 guibg=255

set laststatus=2
set statusline=
highlight StatusLineStyle ctermbg=34 ctermfg=15 guibg=#afe46c guifg=#ffffff
highlight LineCount guifg=#f1b03c
highlight link User9 StatusLineStyle
highlight link User8 LineCount

set statusline=%9*
" set statusline+=%#StatusLineStyle#
set statusline+=\ \ 
set statusline+=%0*
set statusline+=\ ...
set statusline+=%-20.30f  " filename, truncated if necessary
set statusline+=%r  " read only flag
set statusline+=%m  " mark if changes made
" set statusline=%*

set statusline+=%=  " switch to the right hand side

" set statusline+=%*  " show filetype
" set statusline=%9*
" set statusline+=%y  " show filetype
set statusline+=%8*
set statusline+=%4l/%2L:%3c  " show line and col numbers
" set statusline+=%*  " show filetype

