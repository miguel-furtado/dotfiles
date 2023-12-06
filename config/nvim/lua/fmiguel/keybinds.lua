local function nmap(keys, action)
  vim.keymap.set("n", keys, action, {silent=true})
end

-- general
nmap("<leader>w", function() vim.cmd("w") end)
nmap("<leader>E", function() vim.cmd("Ex") end)

-- telescope
local telescope = require"telescope.builtin"
nmap("<leader>ff", telescope.find_files)
nmap("<leader>sw", telescope.lsp_workspace_symbols)
nmap("<leader>ss", telescope.lsp_document_symbols)
nmap("<leader>dg", telescope.diagnostics)
nmap("<leader>gg", telescope.live_grep)
nmap("<leader>gr", telescope.lsp_references)

-- only set when an lsp is attached
vim.api.nvim_create_autocmd("LspAttach", {
  pattern = {"*"},
  callback = function()
    nmap("K", vim.lsp.buf.hover)
    nmap("<leader>gd", vim.lsp.buf.definition)
    nmap("<leader>gt", vim.lsp.buf.type_definition)
    nmap("<leader>gi", vim.lsp.buf.implementation)
    nmap("<leader>ee", vim.diagnostic.open_float)
    nmap("<leader>dj", vim.diagnostic.goto_next)
    nmap("<leader>dk", vim.diagnostic.goto_prev)
    nmap("<leader>R", vim.lsp.buf.rename)
    nmap("<leader>a", vim.lsp.buf.code_action)
  end
})

