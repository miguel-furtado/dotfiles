return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()

      -- Disappearing statusline for commands
      -- Copied from:
      -- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/after/plugin/statusline.lua
      vim.opt.cmdheight = 0
      vim.api.nvim_create_autocmd("ModeChanged", {
        group = vim.api.nvim_create_augroup("StatusDisappear", { clear = true }),
        callback = function()
          if vim.v.event.new_mode == "c" then
            vim.opt.laststatus = 0
          elseif vim.v.event.old_mode == "c" then
            vim.opt.laststatus = 3
          end
          pcall(vim.cmd, [[silent! redraw]])
        end,
      })

      require"lualine".setup({
        options = {
          globalstatus = true,
          component_separators = "|",
          section_separators = "",
        },
        sections = {
          lualine_a = {"mode"},
          lualine_b = {"branch", "diff", "diagnostics"},
          lualine_c = {{"filename", path = 1}},
          lualine_x = {"filetype"},
          lualine_y = {"progress"},
          lualine_z = {"location"}
        },
      })
    end
  },
}

