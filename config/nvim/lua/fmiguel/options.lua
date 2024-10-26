vim.o.number = true
vim.o.spell = true
vim.o.mouse = "a" -- enable mouse cursor
vim.o.encoding = "UTF-8"
vim.o.hlsearch = false
vim.o.laststatus = 3
vim.o.title = true
vim.opt.scrolloff = 8
vim.opt.swapfile = false
vim.wo.wrap = false
vim.opt.list = true -- show ghost characters for tabs and leading spaces

-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = "nomod nu nobl nowrap ro" -- line numbers in netrw

-- Tabs and indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.opt.smartindent = true

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", function()
	vim.cmd("w")
end, { silent = true })
vim.keymap.set("n", "<leader>E", function()
	vim.cmd("Ex")
end, { silent = true })

