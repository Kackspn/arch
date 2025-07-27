-- ~/.config/nvim/lua/lsp_servers/lua_ls.lua
return {
  settings = {
    Lua = {
      runtime = {
        version = "Neovim",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
