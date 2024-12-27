return {
	"echasnovski/mini.nvim",
	version = "0.x.x",
	lazy = false,
	keys = { {
		"<leader>df",
		function()
			require("mini.diff").toggle_overlay()
		end,
	} },
	config = function()
		require("mini.diff").setup({
			view = {
				style = "sign",
				signs = { add = "+", change = "~", delete = "-" },
			},
			delay = { text_change = 0 },
		})
		require("mini.pairs").setup()
	end,
}
