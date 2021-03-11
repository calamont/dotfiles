nnoremap gD :lua vim.lsp.buf.definition()<CR>
nnoremap gd :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>ls :lua vim.lsp.buf.signature_help()<CR>
" nnoremap <leader>lr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>lr :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>lh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>lf :lua vim.lsp.buf.formatting()<CR>
" nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
" nnoremap <leader>vsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>ld :lua vim.lsp.diagnostic.goto_next()<CR>

" Use <C-n> and <C-N> to navigate through plugin autocomplete
" popup menu. We reserve tab autocompletion using vims built-in
" dictionary and the current source files as these will autocomplete
" any word the exists in the current source file. This is useful
" for all text files and will probably be used more than functions
" attached to an instantiated class.
imap <C-n> <Plug>(completion_smart_tab)
imap <C-N> <Plug>(completion_smart_s_tab)

lua << EOF
require'lspconfig'.pyright.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.tsserver.setup{}
require'lspconfig'.terraformls.setup{
  filetypes = { "terraform" , "tf" }
}
EOF
