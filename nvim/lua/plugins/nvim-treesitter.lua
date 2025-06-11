local config = function()
  require("nvim-treesitter.configs").setup({
    autotag = {
      enable = true,
    },
    ensure_installed = {
      "markdown",
      "json",
      "javascript",
      "yaml",
      "html",
      "css",
      "bash",
      "lua",
      "dockerfile",
      "solidity",
      "gitignore",
      "python",
      "vue",
      "c",
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
  })
end

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = config,
}
