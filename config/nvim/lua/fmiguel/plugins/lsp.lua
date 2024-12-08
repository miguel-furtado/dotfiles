return {
	"neovim/nvim-lspconfig",
	version = "^1",
	config = function ()
		-- Disable inline error messages
		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = false,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "Enable lsp keymaps when an lsp is attached",
			callback = function()
				vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
				vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition)
				vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation)
				vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename)
				vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)
			end,
		})

		-- Broadcast neovim's native and cmp's capabilities to the server
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		servers = { "html", "cssls", "ts_ls", "eslint", "jsonls", "dockerls", "pyright", "clangd", "jdtls" }

		for _, server in ipairs(servers) do
			require("lspconfig")[server].setup({
				capabilities = capabilities,
			})
		end
	end
}
