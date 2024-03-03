-- Remove trailing spaces on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
    vim.lsp.buf.format()
  end
})

-- Highlight yanked region
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { timeout=200 }
  end,
})

