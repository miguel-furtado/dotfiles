return {
	"stevearc/conform.nvim",
	version = "^8",
	keys = { {
		"<leader>ff",
		function()
			require("conform").format()
		end,
	} },
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
			["_"] = { "trim_whitespace" }, -- for filetypes that don't have a configured formatter
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
	},
}
