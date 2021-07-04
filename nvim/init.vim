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

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'ayu-theme/ayu-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'glepnir/oceanic-material'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

:Plug 'neovim/nvim-lspconfig'
:Plug 'nvim-lua/completion-nvim'

" :Plug 'dbeniamine/cheat.sh-vim'

call plug#end()

" 1. COMPUTER SETTINGS/INTERACTIONS
" Tell nvim which python versions to use. This speeds up loading .py files.
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/Users/cal_lamont/.pyenv/shims/python'

scriptencoding utf-8

" Never ring bell. Could alse use :set noerrorbells
if exists('&belloff')
  set belloff=all
endif

" Allow mouse to interact with vim"
set mouse=a

" Search down into folders. Provides tab-completion for all file-related tasks
set path+=**

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" Unsure if I want the below on or not.
" If in git repo then move to the working tree root to assist with fuzzy
" searching
" let dirRoot = system("git rev-parse --show-toplevel")
" if (dirRoot =~ 'fatal') || (strlen(dirRoot) == 0)
"     let dirRoot = system("echo $PWD")
" endif
" execute ':cd ' . dirRoot

" Clear the PAGER environment variable inside of Vim. This is to handle the 
" case where you start Vim normally and want to use Vim's 'Man' function. 
" TODO: This doesn't seem to play well with neovim at the moment so still
" using vim for man pages.
let $PAGER=''

" Modify saving of backup files
if exists("$SUDO_USER")
    set nobackup                                 " don't create root owned files
    set nowritebackup                            " don't create root owned files
    set noswapfile                               " don't create root owned files
    set noundofile                               " don't create root owned files
else                                             " keep backup files out of the way
    set backupdir=~/.local/nvim/tmp/backup//      " // appends full file paths to dirs
    set backupdir+=~/.config/nvim/tmp/backup//
    set backupdir+=.
    set directory=~/.local/nvim/tmp/swap//
    set directory+=~/.config/nvim/tmp/swap//
    set directory+=.
    set undodir=~/.local/nvim/tmp/undo//
    set undodir+=~/.config/nvim/tmp/undo//
    set undodir+=.
    set undofile
endif

" Dont show certain filetypes when tab completing
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=*.pyc

" Allow seamly yanking and copying between vim and other programs
" This seems like it would be useful but I actually find it annoying
" that whatever is in my clipboard gets overwritten when I yank something
" else
" set clipboard+=unnamedplus

" 2. REMAPS
" Make space the leader key and backslash the space/<Right> key.
let mapleader = " "

" Keep highlighting but make it easier to clear
map <Leader><Leader> :nohlsearch<enter>

" Change regex to very 'very magic' all the time
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
nnoremap :g/ :g/\v
nnoremap :g// :g//

" Enter commands in the command line window. This allows you to
" search and select previous commands.
" This is largely redundant with the use of `Telescope command_history`
" nnoremap : q:i

" Make yanking behaviour similar to deleting
nnoremap Y y$

" Move current line either up or down then re-indent
" Currently commented out as I can't think of a good
" key mapping for this command!
" nnoremap <C-=> :m .+1<CR>==
" nnoremap <C--> :m .-2<CR>==

" Easier saving and quiting
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :wq<CR>

" The below mappings allow you to select/yank/delete/change spans
" of alphanumeric text. This is particularly useful in python if 
" you need to update part of a parameter name composed of many
" underscores (e.g. transformed_text_data)
nnoremap <Leader>u /\v[a-zA-Z0-9]*%#[a-zA-Z0-9]*<CR>:nohlsearch<CR>gn
nnoremap <Leader>yu /\v[a-zA-Z0-9]*%#[a-zA-Z0-9]*<CR>:nohlsearch<CR>gny
nnoremap <Leader>du /\v[a-zA-Z0-9]*%#[a-zA-Z0-9]*<CR>:nohlsearch<CR>gnd
nnoremap <Leader>cu /\v[a-zA-Z0-9]*%#[a-zA-Z0-9]*<CR>:nohlsearch<CR>gnc

" The below commands will insert a blank line above and below the current line
nnoremap <silent><Leader>l :set paste<CR>m`O<Esc>``:set nopaste<CR>
nnoremap <silent><Leader>h :set paste<CR>m`o<Esc>``:set nopaste<CR>

" Fugutive Git remappings!!
nnoremap <Leader>gs :Git<CR>  " show git status
nnoremap <Leader>gf :Ge:<CR>  " show git status full screen
nnoremap <Leader>gu :Git push<CR>
nnoremap <Leader>gb :Git blame<CR>

" Custom remappings for specific Lua functions
lua require('cal_lamont')
lua require('cal_lamont.cheatsheet')
" lua require('cal_lamont.cheatsheet')
nnoremap <Leader>cs :call v:lua.cheatsheet('')<left><left>
