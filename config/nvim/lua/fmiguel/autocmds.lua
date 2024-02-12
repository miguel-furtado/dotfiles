-- Remove trailing spaces on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*"},
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
    vim.lsp.buf.format()
  end
})

-- Highlight yanked region
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = {"*"},
  callback = function()
    vim.highlight.on_yank { timeout=500 }
  end,
})

