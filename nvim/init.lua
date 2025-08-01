-----------------------------------------------------
--- IMPORT FILES
-----------------------------------------------------
require('options')
require('keymaps')
require('commands')
require('nvimcmp')

-----------------------------------------------------
--- PACKAGES
-----------------------------------------------------
vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/0xstepit/flow.nvim" },
  { src = "https://github.com/folke/lazydev.nvim" },
  { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
  { src = "https://github.com/arnamak/stay-centered.nvim" },
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/windwp/nvim-autopairs" },
  { src = "https://github.com/monkoose/neocodeium" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/machakann/vim-highlightedyank" },
  { src = "https://github.com/scottmckendry/cyberdream.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },

})

-----------------------------------------------------
--- PACKAGE SETUP
-----------------------------------------------------
require('setup')

-----------------------------------------------------
--- MISC AND LSP
-----------------------------------------------------
vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
})
vim.cmd.colorscheme "flow"
-- vim.cmd.colorscheme "cyberdream"
vim.lsp.enable({ "lua_ls", "clangd", "rust_analyzer", "pyright", "bashls" })
