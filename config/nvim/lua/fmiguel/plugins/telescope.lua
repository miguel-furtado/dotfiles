return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {'<leader>sf', function() require('telescope.builtin').find_files() end},
    {'<leader>gg', function() require('telescope.builtin').live_grep() end},
    {'<leader>gr', function() require('telescope.builtin').lsp_references() end},
    {'<leader>ss', function() require('telescope.builtin').lsp_document_symbols() end},
    {'<leader>sw', function() require('telescope.builtin').lsp_workspace_symbols() end},
    {'<leader>dg', function() require('telescope.builtin').diagnostics() end},
  },
	opts = {
		defaults = {
			file_ignore_patterns = { ".git/", "node_modules/" }
      },
      pickers = {
        find_files = { hidden = true },
      },
	}
}

