return {
  "rebelot/kanagawa.nvim",
  config = function()
    vim.api.nvim_create_autocmd("BufRead", {
      pattern = {"*.js", "*.ts"},
      callback = function()
        require"kanagawa".config.colors.theme.all = {syn = {constant = "none"}}
        vim.cmd("colorscheme kanagawa")
      end,
    })
    vim.cmd("colorscheme kanagawa")
  end
}
