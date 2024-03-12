local servers = {
	"html",
	"cssls",
	"tsserver",
	"eslint",
	"jsonls",
	"dockerls",
	"gopls",
	"pyright",
	"rust_analyzer",
}

return {
	"neovim/nvim-lspconfig",
	config = function()
		-- Disable inline error messages
		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = false,
		})

		-- Broadcast neovim's native and cmp's capabilities to the server
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local lspconfig = require("lspconfig")
		for _, server in ipairs(servers) do
			lspconfig[server].setup({
				capabilities = capabilities,
			})
		end

		--
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "Enable lsp keymaps when an lsp is attached",
			callback = function()
				vim.keymap.set("n", "K", vim.lsp.buf.hover)
				vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
				vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition)
				vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation)
				vim.keymap.set("n", "<leader>ee", vim.diagnostic.open_float)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
				vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename)
				vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)
				vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
				vim.keymap.set("n", "<leader>ss", vim.lsp.buf.document_symbol)
				-- figure out vim.lsp.buf.workspace_symbol
			end,
		})
	end,
}
