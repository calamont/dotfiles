" 2. DEFAULT WINDOW SETTINGS
" Default tab options.
setlocal shiftwidth=4
setlocal expandtab                                      " tabs are spaces
setlocal tabstop=4                                      " number of visual spaces per TAB
setlocal softtabstop=4                                  " number of spaces in tab when editing
setlocal shiftround
setlocal autoindent
setlocal nowrap                                              " don't wrap text around
setlocal scrolloff=8                                         " start scrolling 8 lines from screen top/bottom
" set signcolumn=yes                                      " gutter for linting/git

" Infer and colour syntax using the filetype.
filetype on
syntax on  " turn on syntax highlighting

" set hidden                                       " allows hiding buffer w/o saving
" set autowriteall                                 " autosaves buffer before hiding
" set highlight+=c:LineNr                          " highlight line number differently
set guicursor=                                   " use block cursor
set number                                       " show absolute line number for cursor
set list                                         " show whitespace
set listchars+=trail:•                           " show trailing whitespace with bullets
set listchars+=eol:⠀                             " U+2800 (blank) - don't show eol

" Nicer interarction with autocomplete/LSP
set completeopt=menu,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Avoid showing message extra message when using completion
set shortmess+=c
" Don't pop up autocompletion by default
let g:completion_enable_auto_popup = 0
let g:completion_enable_auto_hover = 0
" let g:completion_enable_auto_signature = 0

" General settings for splits
set splitbelow
set splitright
set rnu

" Briefly highlight yanked region of text
augroup highlight_yank
    if exists('##TextYankPost')
        autocmd!
        autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
    endif
augroup end

" Set solid vertical border between panes.
if has('folding')
  if has('windows')
    set fillchars=vert:┃
    " set fillchars=vert:│                       " can't tell if I like the thinner version more...
  endif
endif

" enable true colors support
set t_Co=256  " for vim 7
if (has("termguicolors"))  " for vim 8/neovim
  set termguicolors
endif

" setting colorscheme

" let g:gruvbox_contrast_dark = 'medium'
" colorscheme gruvbox

let ayucolor = 'mirage'
colorscheme ayu
" let g:airline_theme='ayu_mirage'

" set background=dark
" let g:oceanic_material_transparent_background = 1
" let g:oceanic_material_allow_italic = 1
" let g:oceanic_material_allow_bold = 0
" let g:oceanic_material_background = 'medium'
" colorscheme oceanic_material

" let g:oceanic_next_terminal_bold = 0
" let g:oceanic_next_terminal_italic = 1
 " colorscheme OceanicNext

" colorscheme onedark
 " highlight Normal guibg=NONE                            " transparent background

" let g:airline_powerline_fonts = 1
" let g:airline_theme='deus'

" Change line number colours from theme default
" gruvbox (dark) - #bdae93
highlight LineNr guifg=#7D7C8F

" Change cursor line and column colour
" ayu (mirage) - 323A4D
highlight CursorLine guibg=#323A4D
highlight ColorColumn guibg=#323A4D
" highlight StatusLine guifg=#000000 guibg=#323A4D

" Change default message colours
highlight LspDiagnosticsDefaultError guifg=#FF3059
highlight LspDiagnosticsDefaultWarning guifg=#FF7E00
highlight LspDiagnosticsDefaultHint guifg=#73C202
