let &colorcolumn=join(range(80,400),",")        " highlight columns after 80
set highlight+=c:LineNr                          " highlight line number differently
" Set line numbers as default in files and netrw
setlocal number

" Scroll before getting to the bottom of the screen **doesn't seem to be
" working in python!
set scrolloff=8

setlocal showmatch                               " highlight matching paren

setlocal define=^\\s*\\<\\(class\\\|def\\)\\>\\s
" xnoremap <silent><leader>p :w !python<cr>
setlocal cursorline                              " highlight line cursor is on
set wildignore+=*.pyc

" Set the compiler to lint. Define a mapping to run it silently and then open
" quickfix window
compiler python
nnoremap <buffer> <leader>li :silent make --exclude=build,tests<CR> <Bar>:redraw!<CR>:cw 20<CR>
