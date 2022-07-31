---
-- Configuración global
---
vim.cmd [[
    packadd lspconfig
    packadd lsp-installer
    packadd cmp
    packadd cmp-buffer
    packadd cmp-lsp
    packadd cmp-path
    packadd cmp-luasnip
    packadd cmp-nvlua
    packadd lsp-zero
]]

local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.nvim_workspace()
lsp.ensure_installed({
  'gopls',
})
lsp.setup()

