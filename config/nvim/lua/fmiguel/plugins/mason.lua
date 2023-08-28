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

function setup_dap(servers)
  local dap, widgets = require"dap", require"dap.ui.widgets"
  require"mason-nvim-dap".setup {
    ensure_installed = servers,
    automatic_setup = true,
  }

  local widget = widgets.sidebar(widgets.scopes)
  dap.listeners.after.event_initialized["dap"] = function()
    widget.open()
  end
  dap.listeners.before.event_terminated["dap"] = function()
    widget.close()
  end
  dap.listeners.before.event_exited["dap"] = function()
    widget.close()
  end
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
        -- need this because the mason setup does not include running
        -- delve with args
        "leoluz/nvim-dap-go",
        ft = "go",
        config = function()
          require("dap-go").setup()
        end,
      },
    },
  },
}

