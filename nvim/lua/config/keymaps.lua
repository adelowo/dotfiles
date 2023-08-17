-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>su", vim.cmd.UndotreeToggle)

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>p", builtin.git_files, {})
vim.keymap.set("n", "<leader>h", builtin.help_tags, {})
