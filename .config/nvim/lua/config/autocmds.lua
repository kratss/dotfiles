-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Wrap text in HTML files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "html",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.textwidth = 0
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "bib", "plaintex" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.textwidth = 0
  end,
})

-- Automatically save changes every second
local timer = nil
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  callback = function()
    if timer then
      timer:stop()
    end
    timer = vim.defer_fn(function()
      vim.cmd("silent! write")
    end, 1500) -- 1000 ms = 1 second
  end,
})

vim.opt.swapfile = true

-- Set window title
vim.opt.title = true
vim.opt.titlestring = "vi: %t"
