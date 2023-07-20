return {
  {
    "windwp/nvim-autopairs", -- auto-close pairs
    config = {
      check_ts = true,
      disable_filetype = { "TelescopePrompt" },
    },
    event = "InsertEnter",
  },
}

