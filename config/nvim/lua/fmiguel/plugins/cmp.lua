function setup()
  require("luasnip.loaders.from_vscode").lazy_load() --friendly-snippets
  require("luasnip.loaders.from_snipmate").lazy_load() -- custom snippets in ./snippets

  vim.opt.completeopt = {"menu","menuone","noselect"}
  local cmp = require("cmp")
  cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<c-y>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" },
      { name = "buffer" },
    }),
    experimental = {
      ghost_text = true,
    },
  })
end

return {
  {
    -- the latest release is from August 2022 but there were a lot of commits
    -- since and the project is very actively maintained so I'll wait till the
    -- next release to specify a version.
    -- TODO use a version on next release
    "hrsh7th/nvim-cmp", -- the completion engine
    event = "InsertEnter",
    config = setup,
    dependencies = {
      {
        -- snippets engine
        "L3MON4D3/LuaSnip",
        version = "^2",
      },
      "saadparwaiz1/cmp_luasnip", -- the luasnip driver for cmp
      "hrsh7th/cmp-buffer", -- words from the curr buffer
      "hrsh7th/cmp-path", -- path auto-completion
      "hrsh7th/cmp-nvim-lsp",
      "rafamadriz/friendly-snippets", -- a bunch of preconfigured snippets for various languages
    },
  },
}

