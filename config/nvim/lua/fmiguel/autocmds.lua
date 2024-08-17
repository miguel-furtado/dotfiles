vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Remove trailing spaces on save",
	callback = function()
		vim.cmd([[%s/\s\+$//e]])
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked region",
	callback = function()
		vim.highlight.on_yank({ timeout = 250 })
	end,
})
