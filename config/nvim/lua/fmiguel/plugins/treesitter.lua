return {
  "nvim-treesitter/nvim-treesitter",
  version = "0.x.x",
  build = ":TSUpdate",
  config = function()
    require"nvim-treesitter.configs".setup {
      auto_install = true,
      highlight = { enable = true },
      indent = {
        enable = {"javascript", "typescript" },
      },
    }
  end,
}

