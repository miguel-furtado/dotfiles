local servers = {
  "html",
  "cssls",
  "tsserver",
  "eslint",
  "jsonls",
  "dockerls",
  "gopls",
  "pyright",
}

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Disable inline error messages
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
      })

      -- Broadcast snippet capability for completion
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      local lspconfig = require("lspconfig")
      for _, server  in ipairs(servers) do
        lspconfig[server].setup {
          capabilities = capabilities,
        }
      end
    end,
  },
}
