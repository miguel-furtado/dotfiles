function setup()
  local telescope = require("telescope")
  telescope.setup {
    defaults = {
      color_devicons = true,
      file_ignore_patterns = {"^.git/", "^lib/", "^bin/", "^__pycache__/", "^node_modules/"},
      prompt_prefix = "❯ ",
    },
    pickers = {
      find_files = {
        hidden = true,
      },
    }
  }
  telescope.load_extension("fzf")
end

return {
  {
    "nvim-telescope/telescope.nvim",
    version = "0.x.x",
    config = setup,
    dependencies = {
      {"nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },
}

