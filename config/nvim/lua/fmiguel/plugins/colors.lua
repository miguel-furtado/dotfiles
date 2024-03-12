return {
  { 'vimpostor/vim-lumen' },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup {
        dark_variant = "moon", -- main, moon, or dawn
        styles = {
          italic = false,
        },
      }
      vim.cmd.colorscheme("rose-pine")
    end
  },
}
