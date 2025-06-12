return {
	"neovim/nvim-lspconfig",
	version = "^2",
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "Enable lsp keymaps when an lsp is attached",
			callback = function()
				vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition)
				vim.keymap.set("n", "grr", function()
					vim.lsp.buf.references({ includeDeclaration = false })
				end)
			end,
		})

		local servers = {
			"html",
			"cssls",
			"ts_ls",
			"eslint",
			"jsonls",
			"dockerls",
			"clangd",
			"jdtls",
			"rust_analyzer",
			"basedpyright",
		}
		for _, server in ipairs(servers) do
			vim.lsp.enable(server)
		end
	end,
}
