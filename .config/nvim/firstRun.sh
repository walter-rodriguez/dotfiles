#!/bin/bash

echo "Configurando Neovim..."

cd ~
mkdir -p .config/nvim/pack/wfrs/{opt,start}
cd .config/nvim/pack/wfrs/start
git clone https://github.com/jiangmiao/auto-pairs.git autopairs
git clone https://github.com/easymotion/vim-easymotion.git easymotion
git clone https://github.com/junegunn/vim-easy-align.git easyalign
git clone https://github.com/junegunn/fzf.vim.git fzf
git clone https://github.com/tpope/vim-fugitive.git fugitive
git clone https://github.com/tpope/vim-surround.git surround
git clone https://github.com/tpope/vim-repeat repeat
git clone https://github.com/L3MON4D3/LuaSnip.git luasnip
git clone https://github.com/preservim/nerdcommenter.git nerdcommenter
git clone https://github.com/preservim/vimux.git vimux
git clone https://github.com/rafamadriz/friendly-snippets.git fsnippets

cd ../opt
git clone https://github.com/fatih/vim-go.git
git clone https://github.com/neovim/nvim-lspconfig.git lspconfig
git clone https://github.com/hrsh7th/nvim-cmp.git cmp
git clone https://github.com/hrsh7th/cmp-buffer.git
git clone https://github.com/hrsh7th/cmp-path.git
git clone https://github.com/hrsh7th/cmp-nvim-lsp.git cmp-lsp
git clone https://github.com/euclidianAce/BetterLua.vim.git luaSyntax
git clone https://github.com/saadparwaiz1/cmp_luasnip.git cmp-luasnip
git clone https://github.com/hrsh7th/cmp-nvim-lua.git cmp-nvlua
git clone https://github.com/VonHeikemen/lsp-zero.nvim.git
git clone https://github.com/williamboman/nvim-lsp-installer.git lsp-installer
git clone https://github.com/mattn/emmet-vim.git emmet
