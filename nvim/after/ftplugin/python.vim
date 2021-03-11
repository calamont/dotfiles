let &colorcolumn=join(range(80,400),",")        " highlight columns after 80
" set highlight+=c:LineNr                          " highlight line number differently - doesn't work on neovim
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
" compiler python
" nnoremap <buffer> <leader>li :silent make --exclude=build,tests<CR> <Bar>:redraw!<CR>:cw 20<CR>

" Use <C-n> and <C-N> to navigate through plugin autocomplete
" popup menu. We reserve tab autocompletion using vims built-in
" dictionary and the current source files as these will autocomplete
" any word the exists in the current source file. This is useful
" for all text files and will probably be used more than functions
" attached to an instantiated class.
imap <C-n> <Plug>(completion_smart_tab)
imap <C-N> <Plug>(completion_smart_s_tab)
