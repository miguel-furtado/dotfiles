return {
  {
    "nvim-telescope/telescope.nvim",
    version = "0.x.x",
    config = function()
      local telescope = require("telescope")
      telescope.setup {
        defaults = {
          file_ignore_patterns = {"^.git/", "^lib/", "^bin/", "^__pycache__/", "^node_modules/"},
          prompt_prefix = "❯ ",
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      }
      telescope.load_extension("fzf")
    end,
    lazy = true,
    dependencies = {
      {"nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { 'nvim-lua/plenary.nvim', version = "0.x.x"},
    },
  },
}

