setlocal shiftwidth=4
setlocal expandtab                                      " tabs are spaces
setlocal tabstop=4                                      " number of visual spaces per TAB
setlocal softtabstop=4                                  " number of spaces in tab when editing
setlocal shiftround
setlocal autoindent
setlocal number                                         " show line numbers
let &colorcolumn=join(range(100,200),",")                " highlight columns after 80
setlocal cursorline                                     " highlight line cursor is on
setlocal showmatch  					" highlight matching paren
