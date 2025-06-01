vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked region",
	callback = function()
		vim.highlight.on_yank({ timeout = 250 })
	end,
})
