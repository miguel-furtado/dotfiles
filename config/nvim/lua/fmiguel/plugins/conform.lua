return {
	"stevearc/conform.nvim",
	lazy = false,
	version = "^8",
	keys = {{
		"<leader>ff",
		function()
			require("conform").format()
		end,
	}},
	opts = {
		formatters_by_ft = {
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			json = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			less = { "prettier" },
			markdown = { "prettier" },
			yaml = { "prettier" },
			lua = { "stylua" },
			python = { "black" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
	},
}
