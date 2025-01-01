-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = LazyVim.safe_keymap_set
map("n", "<leader>p", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("i", "jk", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("n", "mm", ":")
