-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.opt.winbar = "%=%m %f"

vim.opt.swapfile = false

-- Enable ruler
vim.o.ruler = true

-- Set color column at column 120
vim.cmd("set colorcolumn=120")
vim.cmd("highlight ColorColumn ctermbg=red guibg=red")

vim.g.lazyvim_php_lsp = "intelephense"
