vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.mouse = ''
vim.o.clipboard = 'unnamedplus'

vim.pack.add({
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter.git', lazy = false, build = ':TSUpdate' },
    { src = 'https://github.com/mason-org/mason.nvim.git' },
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
    { src = 'https://github.com/neovim/nvim-lspconfig' }
})

require('nvim-treesitter').setup({ install_dir = vim.fn.stdpath('data') .. '/site' })
require('nvim-treesitter').install ({ 'c' })
require("mason").setup({ ui = { icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" } } })

vim.api.nvim_create_autocmd('FileType', {
    pattern = { '<filetype>' },
    callback = function() vim.treesitter.start() end,
})

vim.diagnostic.config({ virtual_text = { spacing = 0 } })
vim.lsp.config('lua_ls', { settings = { Lua = { diagnostics = { globals = { 'vim' } } } } })
vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
