return {
	{
		"vimpostor/vim-lumen",
		lazy=false,
		priority=1000
	},
	{
		"EdenEast/nightfox.nvim",
		config = function()
			function set_colorscheme()
				if vim.o.background == "light" then
					vim.cmd("colorscheme dayfox")
				else
					vim.cmd("colorscheme carbonfox")
				end
			end

			vim.api.nvim_create_autocmd("OptionSet", {
				desc = "Change colorscheme based on system settings",
				pattern = "background",
				callback = set_colorscheme,
			})

			set_colorscheme()
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		config = function()
			vim.api.nvim_create_autocmd("BufRead", {
				pattern = {"*.js", "*.ts"},
				callback = function()
					require"kanagawa".config.colors.theme.all = {syn = {constant = "none"}}
				end,
			})

			vim.cmd("colorscheme kanagawa")

		end,
	},
}
