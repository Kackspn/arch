local opts = {
  ensure_installed = {
    "clangd",
    "pyright",
    "lua_ls",
    "rust_analyzer",
  },
}

require'lspconfig'.pyright.setup{
}
require'lspconfig'.lua_ls.setup{
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}
require'lspconfig'.clangd.setup{}
require'lspconfig'.rust_analyzer.setup{}

return {
  "williamboman/mason-lspconfig.nvim",
  opts = opts,
  event = "BufReadPre",
  lazy = false,
  dependencies = "williamboman/mason.nvim",
}
