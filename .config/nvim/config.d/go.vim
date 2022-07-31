" ------------------------
" Configuracion para Go
" ------------------------
packadd vim-go
packadd lspconfig

let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_trailing_whitespace_error = 1

" MAPS

" LSP
call LuaConfig('lsp')
lua require'lspconfig'.gopls.setup{}
