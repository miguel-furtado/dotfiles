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

local dap_servers = {
  "python", -- debugpy
  "codelldb", -- rust
  "delve", -- golang
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

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

  require"mason-lspconfig".setup_handlers {
    function (server_name) -- default handler (optional)
      require("lspconfig")[server_name].setup {
        on_attach = function()
          require("fmiguel.keybinds").set_lsp_keybinds()
        end,
        capabilities = capabilities,
      }
    end,
  }

  -- Disable inline error messages
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false
    }
  )
end

function setup_dap(servers)
  local dap = require"mason-nvim-dap"
  dap.setup {
    ensure_installed = servers,
    automatic_setup = true,
  }
  require("fmiguel.keybinds").set_dap_keybinds()
end

function setup()
  require"mason".setup {
      PATH = "prepend",
  }
  setup_lsp(lsp_servers)
  setup_dap(dap_servers)
end

return {
  -- Configurations for Nvim LSP, DAP and Linters
  {
    "williamboman/mason.nvim",
    version = "^1",
    config = setup,
    ft = ft,
    event = "CmdUndefined Mason",
    dependencies = {
      -- provides lspconfig compatibility to mason
      {
        "williamboman/mason-lspconfig.nvim",
        version = "0.x.x",
        dependencies = {
          {
            "neovim/nvim-lspconfig",
            version = "0.x.x",
          },
        },
      },
      {
        "jayp0521/mason-nvim-dap.nvim",
        version = "^2",
        dependencies = {
          "mfussenegger/nvim-dap",
          version = "0.x.x",
        },
      },
      {
        "rcarriga/nvim-dap-ui",
        version = "^3",
        config = function()
          require"dapui".setup()
        end,
      },
      "theHamsta/nvim-dap-virtual-text", -- inline values
      -- need this because the mason setup does not include running
      -- delve with args
      {
        "leoluz/nvim-dap-go",
        ft = "go",
        config = function()
          require("dap-go").setup()
        end,
      },
    },
  },
}

