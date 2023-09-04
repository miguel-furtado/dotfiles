vim.g.mapleader = " "
vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.spell = true
vim.o.mouse = "a" --enable mouse cursor
vim.o.encoding = "UTF-8"
vim.o.laststatus = 3 -- global status-line
vim.o.hlsearch=false
vim.opt.scrolloff = 8
vim.opt.swapfile = false
vim.wo.wrap = false

-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = "nomod nu nobl nowrap ro" -- line numbers in netrw

-- Tabs and indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
require"lazy".setup("fmiguel.plugins", {
  defaults = {
    version = "^10",
  },
  change_detection = {
    enabled = false,
  },
})

require"fmiguel.colors"
require"fmiguel.keybinds"

-- Remove trailing spaces on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*"},
  command = [[%s/\s\+$//e]],
})

-- Highlight yanked region
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = {"*"},
  callback = function()
    vim.highlight.on_yank {
      timeout=500,
    }
	end,
})

