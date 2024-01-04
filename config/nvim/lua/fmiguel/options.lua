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

-- Show ghost chars for some characters like tab an leading space.
vim.opt.list = true
vim.opt.listchars:append({ lead = "."})

-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = "nomod nu nobl nowrap ro" -- line numbers in netrw

-- Tabs and indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.wo.wrap = false

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", function() vim.cmd("w") end, {silent=true})
vim.keymap.set("n", "<leader>E", function() vim.cmd("Ex") end, {silent=true})

