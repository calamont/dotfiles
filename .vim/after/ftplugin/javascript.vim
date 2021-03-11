let &colorcolumn=join(range(80,400),",")        " highlight columns after 80
setlocal cursorline                              " highlight line cursor is on
setlocal showmatch                               " highlight matching paren

" Default tab options.
setlocal shiftwidth=4
setlocal expandtab                                      " tabs are spaces
setlocal tabstop=4                                      " number of visual spaces per TAB
setlocal softtabstop=4                                  " number of spaces in tab when editing
setlocal shiftround
setlocal autoindent
setlocal number                                         " show line numbers

" Includes searching through imported files
setlocal include=^import\\s[0-9a-z]*\\sfrom\\s\"\\zs.*\\ze\"
" setlocal define  TODO: Need to update how a definition looks like in
" javascript
