return {
    "nvim-neo-tree/neo-tree.nvim",
    version = "3",
	lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
    },
	opts = {
		default_component_configs = {
			icon = {
				folder_closed = "+",
				folder_open = "-",
				folder_empty = "∅"
			},
            git_status = {
            symbols = {
              -- Change type
              modified  = "~", -- or "", but this is redundant info if you use git_status_colors on the name
              deleted   = "✘",-- this can only be used in the git_status source
              renamed   = "»",-- this can only be used in the git_status source
              -- Status type
              untracked = "?",
              ignored   = "",
              unstaged  = "",
              staged    = "+",
              conflict  = "=",
            }
          },
		}
	},
	keys = {
		{
			"<C-b>",
			function()
				vim.cmd("Neotree toggle")
			end,
		}
	},
}
