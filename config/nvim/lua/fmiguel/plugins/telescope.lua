return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {'<leader>ff', function() require('telescope.builtin').find_files() end},
    {'<leader>gg', function() require('telescope.builtin').live_grep() end},
    {'<leader>gr', function() require('telescope.builtin').lsp_references() end},
    {'<leader>ss', function() require('telescope.builtin').lsp_document_symbols() end},
    {'<leader>ws', function() require('telescope.builtin').lsp_workspace_symbols() end},
    {'<leader>dg', function() require('telescope.builtin').diagnostics() end},
  }
}

