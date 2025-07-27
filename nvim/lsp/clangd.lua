-- ~/.config/nvim/lsp/clangd.lua
return {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".git"),
}
