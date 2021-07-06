" IMPROVED NAVIGATION AROUND VIM
" Moving around panes more easily"
map <C-m> <C-w>h
map <C-o> <C-w>l
map <C-l> <C-w>k
map <C-h> <C-w>j

" Make moving around eiser for colemak layout
nnoremap l gk
nnoremap j h
nnoremap k l
nnoremap h gj
nnoremap <bslash> <space>

vnoremap l gk
vnoremap h gj
vnoremap j h
vnoremap k l
vnoremap <bslash> <space>

" Scroll down keeping cursor in place
nnoremap <C-c> <C-e>

" Move forward and back jumps
nnoremap <C-i> <C-i>
nnoremap <C-e> <C-o>

nnoremap <Leader>bn :bnext<CR>                   " cycle to next buffer
nnoremap <Leader>bp :bprevious<CR>               " cycle back to last buffer
nnoremap <Leader>bb <C-^>                        " jump back to previous buffer

" Open and cycle through quickfix list
nnoremap <C-q> :copen<CR>
nnoremap <C-]> :cn<CR>
nnoremap <C-[> :cp<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>ch <cmd>Telescope command_history<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fd :lua require('cal_lamont.telescope').search_dotfiles()<CR>
nnoremap <leader>fc :lua require('cal_lamont.telescope').cheatsheet_snippet()<CR>
