return {
	"neovim/nvim-lspconfig",
	version = "^2",
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "Enable lsp keymaps when an lsp is attached",
			callback = function()
				vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			end,
		})

		local servers =
			{ "html", "cssls", "ts_ls", "eslint", "jsonls", "dockerls", "pyright", "clangd", "jdtls", "rust_analyzer" }
		for _, server in ipairs(servers) do
			require("lspconfig")[server].setup{}
		end
	end,
}
