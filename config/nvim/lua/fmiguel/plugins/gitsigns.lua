return {
  {
    "lewis6991/gitsigns.nvim",
    version = "0.x.x",
    event = "BufRead",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    }
  },
}

