return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	dependencies = "rafamadriz/friendly-snippets",
	version = "^1",
	opts = {
		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- will be removed in a future release
			use_nvim_cmp_as_default = true,
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		completion = {
			ghost_text = { enabled = true },
			menu = {
				draw = {
					columns = { { "label" }, { "kind" } },
				},
			},
		},
	},
}
