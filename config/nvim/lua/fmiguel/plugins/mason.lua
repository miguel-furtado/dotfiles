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

function lsp_config()
	-- Broadcast neovim's native and cmp's capabilities to the server
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

	require("mason-lspconfig").setup({
		ensure_installed = {
			"html",
			"cssls",
			"ts_ls",
			"eslint",
			"jsonls",
			"dockerls",
			"pyright",
			"clangd",
		},
	})

	require("mason-lspconfig").setup_handlers({
		function(server_name) -- default handler (optional)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
			})
		end,
	})
end

return {
	{ "williamboman/mason.nvim", opts = {}, version = "1" },
	{
		"williamboman/mason-lspconfig.nvim",
		version = "1",
		config = lsp_config,
	},
	"neovim/nvim-lspconfig",
}
