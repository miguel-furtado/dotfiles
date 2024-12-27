function set_colorscheme()
	if vim.o.background == "light" then
		vim.cmd("colorscheme dayfox")
	else
		vim.cmd("colorscheme dracula")
	end
end

vim.api.nvim_create_autocmd("OptionSet", {
	desc = "Change colorscheme based on system settings",
	pattern = "background",
	callback = set_colorscheme,
})

return {
	{
		"vimpostor/vim-lumen",
		lazy = false,
		priority = 1000,
	},
	{
		"Mofiqul/dracula.nvim",
		config = function()
			set_colorscheme()
		end,
	},
	{
		"EdenEast/nightfox.nvim",
	},
}
