function set_colorscheme()
	if vim.o.background == "dark" then
		vim.cmd("colorscheme carbonfox")
	else
		vim.cmd("colorscheme dayfox")
	end
end

return {
	"vimpostor/vim-lumen",
	{
		"EdenEast/nightfox.nvim",
		config = function()
			vim.api.nvim_create_autocmd("OptionSet", {
				desc = "Change colorscheme based on system settings",
				pattern = "background",
				callback = set_colorscheme,
			})
			set_colorscheme()
		end,
	},
}
