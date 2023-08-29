local lsp_servers = {
  "rust_analyzer",
  "gopls",
  "pyright",
  "tsserver",
  "dockerls",
  "html",
  "cssls",
  "jsonls",
}

local ft = {
  "rust",
  "go",
  "python",
  "dockerfile",
  "html",
  "css",
  "javascript",
  "typescript",
  "json",
}

function setup_lsp(servers)
  require"mason-lspconfig".setup {
    ensure_installed = lsp_servers,
  }

  require"mason-lspconfig".setup_handlers {
    function (server_name) -- default handler
      require("lspconfig")[server_name].setup {}
    end,
  }

  -- Disable inline error messages
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false
    }
  )
end

function setup()
  require"mason".setup {
      PATH = "prepend",
  }
  setup_lsp(lsp_servers)
end

return {
  {
    "williamboman/mason.nvim",
    version = "^1",
    config = setup,
    ft = ft,
    event = "CmdUndefined Mason",
    dependencies = {
      {
        -- provides lspconfig compatibility to mason
        "williamboman/mason-lspconfig.nvim",
        version = "0.x.x",
      },
      {
        "neovim/nvim-lspconfig",
        version = "0.x.x",
      },
    },
  },
}

