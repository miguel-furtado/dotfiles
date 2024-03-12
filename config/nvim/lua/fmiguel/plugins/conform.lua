return {
  'stevearc/conform.nvim',
  lazy = false,
  version = "^5",
  keys = {
    {"<leader>ff", function() require("conform").format() end},
  },
  opts = {
    formatters_by_ft = {
      typescript = {"prettier"},
      typescriptreact = {"prettier"},
      javascript = {"prettier"},
      javascriptreact = {"prettier"},
      json = {"prettier"},
      html = {"prettier"},
      css = {"prettier"},
      scss = {"prettier"},
      less = {"prettier"},
      markdown = {"prettier"},
      yaml = {"prettier"},
    },
    format_on_save = {
      lsp_fallback = true,
    },
  },
}
