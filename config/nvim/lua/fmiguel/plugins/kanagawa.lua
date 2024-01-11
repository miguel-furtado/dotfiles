return {
  "rebelot/kanagawa.nvim",
  config = function()
    require"kanagawa".setup({
      colors = {
        theme = {
          all = {
            syn = {
              constant = "none"
            },
          },
        },
      },
    })
    vim.cmd("colorscheme kanagawa")
  end
}
