return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      vim.api.nvim_create_autocmd("BufRead", {
        pattern = {"*.js", "*.ts"},
        callback = function()
          require"kanagawa".config.colors.theme.all = {syn = {constant = "none"}}
        end,
      })
    end
  },
  {
    "Mofiqul/adwaita.nvim",
    config = function()
      -- vim.g.adwaita_darker = true
      vim.cmd("colorscheme adwaita")
    end
  },
}
