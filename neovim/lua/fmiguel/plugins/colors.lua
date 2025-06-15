return {
	{
		"vimpostor/vim-lumen",
		lazy = false,
		priority = 1000,
	},
	{
		"EdenEast/nightfox.nvim",
		version = "^3",
		config = function()
			function set_colorscheme()
				if vim.o.background == "light" then
					vim.cmd("colorscheme dawnfox")
				else
					vim.cmd("colorscheme carbonfox")
				end
			end

			set_colorscheme()
			vim.api.nvim_create_autocmd("OptionSet", {
				desc = "Update colorscheme on background change",
				pattern = "background",
				callback = function()
					set_colorscheme()
				end,
			})
		end
	}
}
