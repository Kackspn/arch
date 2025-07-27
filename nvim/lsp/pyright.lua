-- ~/.config/nvim/lsp/pyright.lua
return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_dir = require("lspconfig.util").root_pattern("pyproject.toml", "setup.py", "requirements.txt"),
  single_file_support = true,
}
