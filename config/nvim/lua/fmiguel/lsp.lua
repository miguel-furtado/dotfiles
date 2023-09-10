-- Disable inline error messages
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
})

local server_opts = {
  {
    name = "html",
    cmd = {"vscode-html-language-server", "--stdio"},
    ft = {"html"},
    root_dir = {".git", "package.json"},
  },
  {
    name = "cssls",
    cmd = {"vscode-css-language-server", "--stdio"},
    ft = {"css", "scss", "less"},
    root_dir = {".git", "package.json"},
  },
  {
    name = "jsonls",
    cmd = {"vscode-json-language-server", "--stdio" },
    ft = {"json", "jsonc" },
    root_dir = {".git"},
  },
  {
    name = "tsserver",
    cmd = {"typescript-language-server", "--stdio"},
    ft = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
    root_dir = {".git", "package.json", "jsconfig.json", "tsconfig.json"},
  },
  {
    name = "gopls",
    cmd = {"gopls"},
    ft = {"go", "gomod", "gowork", "gotmpl"},
    root_dir = {".git", "go.mod", "go.work"},
  },
  {
    name = "pyright",
    cmd = {"pyright-langserver", "--stdio"},
    ft = {"python"},
    root_dir = {
      ".git",
      "pyproject.toml",
      "setup.py",
      "setup.cfg",
      "requirements.txt",
      "Pipfile",
      "pyrightconfig.json",
    },
  },
  {
    name = "dockerls",
    cmd = {"docker-langserver", "--stdio"},
    ft = {"dockerfile"},
    root_dir = {"Dockerfile"},
  },
  {
    name = "rust-analyzer",
    cmd = {"rust-analyzer"},
    ft = {"rust" },
    root_dir = {".git", "Cargo.toml"}
  },
  {
    name = "eslint",
    cmd = {"vscode-eslint-language-server", "--stdio"},
    ft = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "vue",
      "svelte",
      "astro",
    },
    root_dir = {
      ".eslintrc",
      ".eslintrc.js",
      ".eslintrc.cjs",
      ".eslintrc.yaml",
      ".eslintrc.yml",
      ".eslintrc.json",
      "eslint.config.js",
    },
  },
}

function start_lsp(opts)
  -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

  vim.lsp.start({
    name = opts.name,
    cmd = opts.cmd,
    root_dir = vim.fs.dirname(vim.fs.find(opts.root_dir, {upward = true })[1]),
    capabilities = capabilities,
    detached = false,
  })
end

for _, opt in ipairs(server_opts) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = opt.ft,
    callback = function()
      opt["ft"] = nil
      start_lsp(opt)
    end,
  })
end

