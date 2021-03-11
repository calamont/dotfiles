"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"                     ██████╗ █████╗ ██╗     ███████╗
"                    ██╔════╝██╔══██╗██║     ██╔════╝
"                    ██║     ███████║██║     ███████╗
"                    ██║     ██╔══██║██║     ╚════██║
"                    ╚██████╗██║  ██║███████╗███████║
"                     ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝

"                    ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"                    ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"                    ██║   ██║██║██╔████╔██║██████╔╝██║
"                    ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"                     ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                      ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

scriptencoding utf-8

" Default tab options.
setlocal shiftwidth=4
setlocal expandtab                                      " tabs are spaces
setlocal tabstop=4                                      " number of visual spaces per TAB
setlocal softtabstop=4                                  " number of spaces in tab when editing
setlocal shiftround
setlocal autoindent

" Infer and colour syntax using the filetype.
filetype on
syntax on  " turn on syntax highlighting

" Modify saving of backup files
if exists("$SUDO_USER")
    set nobackup                                 " don't create root owned files
    set nowritebackup                            " don't create root owned files
    set noswapfile                               " don't create root owned files
    set noundofile                               " don't create root owned files
else                                             " keep backup files out of the way
    set backupdir=~/local/.nvim/tmp/backup//      " // appends full file paths to dirs
    set backupdir+=~/.nvim/tmp/backup//
    set backupdir+=.
    set directory=~/local/.nvim/tmp/swapfiles//
    set directory+=~/.nvim/tmp/swapfiles//
    set directory+=.
    set undodir=~/local/.nvim/tmp/undo//
    set undodir+=~/.nvim/tmp/undo//
    set undodir+=.
    set undofile
endif

" Make space the leader key and backslash the space/<Right> key.
let mapleader = " "
nnoremap <bslash> <space>
vnoremap <bslash> <space>
map <Leader><Leader> :nohlsearch<enter>

" Moving around panes more easily"
map <C-m> <C-w>h
map <C-o> <C-w>l
map <C-l> <C-w>k
map <C-h> <C-w>j

nnoremap l gk
nnoremap j h
nnoremap k l
nnoremap h gj
