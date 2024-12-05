return {
	"nvim-telescope/telescope.nvim",
	version = "0.x.x",
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{
			"<leader>sf",
			function()
				require("telescope.builtin").find_files()
			end,
		},
		{
			"<leader>sw",
			function()
				require("telescope.builtin").lsp_workspace_symbols()
			end,
		},
		{
			"<leader>ss",
			function()
				require("telescope.builtin").lsp_document_symbols()
			end,
		},
		{
			"<leader>dg",
			function()
				require("telescope.builtin").diagnostics()
			end,
		},
		{
			"<leader>gg",
			function()
				require("telescope.builtin").live_grep()
			end,
		},
		{
			"<leader>gr",
			function()
				require("telescope.builtin").lsp_references()
			end,
		},
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				file_ignore_patterns = { "^.git/", "^lib/", "^bin/", "^__pycache__/", "^node_modules/" },
			},
			pickers = {
				find_files = { hidden = true },
			},
		})
		telescope.load_extension("fzf")
	end,
}
