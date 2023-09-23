local function nmap(keys, action)
  vim.keymap.set("n", keys, action, {silent=true})
end

-- general
nmap("<leader>w", function() vim.cmd("w") end)
nmap("<leader>E", function() vim.cmd("Ex") end)

-- harpoon
local harpoon_ui = require"harpoon.ui"
nmap("<leader>ha", require"harpoon.mark".add_file)
nmap("<leader>hh", harpoon_ui.toggle_quick_menu)
nmap("<C-h>", function() harpoon_ui.nav_file(1) end)
nmap("<C-j>", function() harpoon_ui.nav_file(2) end)
nmap("<C-k>", function() harpoon_ui.nav_file(3) end)
nmap("<C-l>", function() harpoon_ui.nav_file(4) end)

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

