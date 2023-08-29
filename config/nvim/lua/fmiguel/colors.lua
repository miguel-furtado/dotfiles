function set_theme()
  if vim.o.background == "dark" then
    vim.cmd(string.format("colorscheme %s", "carbonfox"))
    return
  end
  vim.cmd(string.format("colorscheme %s", "dawnfox"))
end

set_theme()

vim.api.nvim_create_autocmd("User", {
  pattern = {"LumenDark", "LumenLight"},
  callback = set_theme,
})

