function config_luasnip()
	local ls = require("luasnip")
	local t = ls.text_node
	local i = ls.insert_node

	ls.add_snippets("javascript", {
		ls.snippet("log", {
			t("console.log("),
			i(1),
			t(")"),
		}),
	})
end

function config_cmp()
	require("luasnip.loaders.from_vscode").lazy_load() --friendly-snippets

	local cmp = require("cmp")
	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<c-y>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "buffer" },
		}),
		experimental = {
			ghost_text = true,
		},
	})
end

return {
	"hrsh7th/nvim-cmp", -- the completion engine
	event = "InsertEnter",
	dependencies = {
		{
			"L3MON4D3/LuaSnip", -- snippets engine
			version = "^2",
			config = config_luasnip,
		},
		"saadparwaiz1/cmp_luasnip", -- the luasnip driver for cmp
		"hrsh7th/cmp-buffer", -- words from the curr buffer
		"hrsh7th/cmp-path", -- path auto-completion
		"hrsh7th/cmp-nvim-lsp",
		"rafamadriz/friendly-snippets", -- a bunch of preconfigured snippets for various languages
	},
	config = config_cmp,
}
