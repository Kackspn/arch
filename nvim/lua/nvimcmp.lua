vim.pack.add({
  { src = "https://github.com/hrsh7th/nvim-cmp" },
		"https://github.com/hrsh7th/cmp-nvim-lsp",
    "https://github.com/hrsh7th/cmp-nvim-lua",
		"https://github.com/hrsh7th/cmp-buffer",
		"https://github.com/hrsh7th/cmp-path",
		"https://github.com/hrsh7th/cmp-cmdline",
		"https://github.com/saadparwaiz1/cmp_luasnip",
		"https://github.com/L3MON4D3/LuaSnip",
})

local cmp = require("cmp")
vim.opt.completeopt = { "menu", "menuone", "noselect" }

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<Left>"] = cmp.mapping.abort(),
    ["<Tab>"] = cmp.mapping.confirm({ select = true}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<Enter>"] = cmp.mapping.confirm({ select = false}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" }, -- For luasnip users.
    -- { name = "orgmode" },
  }, {
    { name = "buffer" },
    { name = "path" },
  }),
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

