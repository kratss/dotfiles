

-- Lazy plugin manager stuff
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


plugins = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}

-- Tells lazy plugin manager what to load. plugins variable defined at top
require("lazy").setup(plugins, opts)

vim.cmd[[colorscheme tokyonight-moon]]
vim.cmd[[inoremap jk <ESC>]]
vim.cmd[[vnoremap jk <ESC>]]
vim.cmd[[noremap ; :]]

-- Replace tabs with four spaces
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Wrap at words
vim.opt.linebreak = true

-- Fold on indents
vim.opt.foldmethod = "syntax"
