-- Remove trailing spaces on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*"},
  command = [[%s/\s\+$//e]],
})

-- Highlight yanked region
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = {"*"},
  callback = function()
    vim.highlight.on_yank { timeout=500 }
  end,
})

