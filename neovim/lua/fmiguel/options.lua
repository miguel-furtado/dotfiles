vim.o.number = true
vim.o.spell = true
vim.o.mouse = "a" -- enable mouse cursor
vim.o.encoding = "UTF-8"
vim.o.hlsearch = false
vim.o.laststatus = 0
vim.o.title = true
vim.opt.scrolloff = 8
vim.opt.swapfile = false
vim.wo.wrap = false
vim.opt.list = true -- show ghost characters for tabs and leading spaces
vim.o.guicursor = "n-v-c-i:block"
vim.o.termguicolors = true
vim.opt.cursorline = true

-- Netrw
vim.g.netrw_bufsettings = "nomod nobl nowrap ro" -- line numbers in netrw
vim.g.netrw_liststyle = 3

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

-- disable inline diagnostics
vim.diagnostic.config({ virtual_text = false })
