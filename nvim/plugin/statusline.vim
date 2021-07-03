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

set laststatus=2
set statusline=

set statusline=%9*
" set statusline+=%#StatusLineStyle#
set statusline+=\ 
set statusline+=%7*
" set statusline+=\ ...
set statusline+=\ 
set statusline+=%-20.50f  " filename, truncated if necessary
set statusline+=%r  " read only flag
set statusline+=%m  " mark if changes made
" set statusline=%*

set statusline+=%=  " switch to the right hand side

" set statusline+=%*  " show filetype
" set statusline=%9*
" set statusline+=%y  " show filetype
" set statusline+=
set statusline+=%{FugitiveHead()}\ 
set statusline+=%4l/%2L\ \|%3c  " show line and col numbers
" set statusline+=%*  " show filetype

