" Callum Lamont's vimrc
scriptencoding utf-8

" Default tab options.
setlocal shiftwidth=4
setlocal expandtab                                      " tabs are spaces
setlocal tabstop=4                                      " number of visual spaces per TAB
setlocal softtabstop=4                                  " number of spaces in tab when editing
setlocal shiftround
setlocal autoindent
setlocal number                                         " show line numbers

if v:progname =~? "evim"
  finish
endif

" Modify saving of backup files
if exists("$SUDO_USER")
    set nobackup                                 " don't create root owned files
    set nowritebackup                            " don't create root owned files
    set noswapfile                               " don't create root owned files
    set noundofile                               " don't create root owned files
else                                             " keep backup files out of the way
    set backupdir=~/local/.vim/tmp/backup//      " // appends full file paths to dirs
    set backupdir+=~/.vim/tmp/backup//
    set backupdir+=.
    set directory=~/local/.vim/tmp/swapfiles//
    set directory+=~/.vim/tmp/swapfiles//
    set directory+=.
    set undodir=~/local/.vim/tmp/undo//
    set undodir+=~/.vim/tmp/undo//
    set undodir+=.
    set undofile
endif

" Infer and colour syntax using the filetype.
filetype on
syntax on  " turn on syntax highlighting

" Make space the leader key and backslash the space/<Right> key.
let mapleader = " "
nnoremap <bslash> <space>
map <Leader><Leader> :nohlsearch<enter>
nnoremap <Leader>i :set foldmethod:indent
nnoremap <Leader>l zc
nnoremap <Leader>u zC
nnoremap <Leader>h zo
nnoremap <Leader>, zO
nnoremap <Leader>r zR
nnoremap <Leader>m zM
nnoremap <Leader>gi :G<CR>
nnoremap Y y$

" Moving around panes more easily"
map <C-m> <C-w>h
map <C-o> <C-w>l
map <C-l> <C-w>k
map <C-h> <C-w>j

nnoremap l gk
nnoremap h gj
nnoremap j h
nnoremap k l

vnoremap l gk
vnoremap h gj
vnoremap j h
vnoremap k l

let g:tmux_navigator_no_mappings = 1
" nnoremap <silent> <C-m> :TmuxNavigateLeft<cr>
" nnoremap <silent> <C-h>: TmuxNavigateDown<cr>
" nnoremap <silent> <C-l> :TmuxNavigateUp<cr>
" nnoremap <silent> <C-o> :TmuxNavigateRight<cr>
" " nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" Change scroll down
" nnoremap <C-l> <C-e>

" Move forward and back jumps
nnoremap <C-i> <C-i>
nnoremap <C-e> <C-o>

inoremap <C-f> <right>
inoremap <C-b> <left>

" Change regex to very 'very magic' all the time
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
nnoremap :g/ :g/\v
nnoremap :g// :g//

" Enter commands in the command line window. This allows you to
" search and select previous commands.
nnoremap : q:i

set splitbelow
set splitright
set rnu

" Set solid vertical border between panes.
if has('folding')
  if has('windows')
    set fillchars=vert:┃
    " set fillchars=vert:│                       " can't tell if I like the thinner version more...
  endif
endif

set hidden                                       " allows hiding buffer w/o saving
set highlight+=c:LineNr                          " highlight line number differently
set list                                         " show whitespace
set listchars+=trail:•                           " show trailing whitespace with bullets
set listchars+=eol:⠀                             " U+2800 (blank) - don't show eol


"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.
"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" Allow mouse to interact with vim"
set ttymouse=xterm2
set mouse=a

" Search down into folders. Provides tab-completion for all file-related tasks
set path+=**
set tags=tags,.git/tags
" If in git repo then move to the working tree root to assis with fuzzy
" searching
let dirRoot = system("git rev-parse --show-toplevel")
if (dirRoot =~ "fatal") || (strlen(dirRoot) == 0)
    let dirRoot = system("echo $PWD")
endif
execute ':cd ' . dirRoot
" Initialis fuzzy-like file finding in current buffer or split window
nnoremap <Leader>o :find **
nnoremap <Leader>v :vsplit **/
nnoremap <Leader>s :split **/
" Display all matching files when we tab complete
set wildmenu
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=*.pyc

let g:airline_powerline_fonts = 1
let g:airline_theme='hybrid'

" ---- Colours ---- "
set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
let g:gruvbox_contrast_dark = "medium"

set t_Co=256
" background=dark
" colorscheme ayu
colorscheme gruvbox
" colorscheme materialbox
" colorscheme OceanicNext
" colorscheme lucius
" colorscheme pink-moon
" colorscheme sierra
" colorscheme base16-codeschool
" colorscheme base16-nord-darker

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif


" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=79
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Change line number colours from theme default
" gruvbox (dark) - #bdae93
highlight LineNr guifg=#bdae93

" Clear the PAGER environment variable inside of Vim. This is to handle the 
" case where you start Vim normally and want to use Vim's 'Man' function. 
let $PAGER=''

" Never ring bell, ever.
if exists('&belloff')
  set belloff=all
endif

" Add indentation for wrapped lines.
if has('linebreak')
  set breakindent
  let &showbreak='➤ '                            " emphasise where text is wrapped
  if exists('breakindentopt')
    set breakindentopt=shift:2
  endif
endif
"
" Auto-indenting of numbered lists - doesn't seem to work atm.
" set formatoptions+=n                             
