vim.o.guicursor="n-v-c-i:block"
vim.g.mapleader = " "
vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.spell = true
vim.o.mouse = "a" --enable mouse cursor
vim.o.encoding = "UTF-8"
vim.o.laststatus = 3 -- global status-line
vim.o.hlsearch=false
vim.o.laststatus = 0
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

