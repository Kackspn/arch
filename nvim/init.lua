require('commands')
require('options')
require('nvimcmp')

local keymapset = vim.keymap.set
local opts = { silent = true, noremap = true }


-----------------------------------------------------
--- KEYMAPS
-----------------------------------------------------
-- Save/exit commands
keymapset("n", "C", ":write<CR>", opts)
keymapset("i", "<C-c>", "<Escape>:write<CR>", opts)
keymapset("n", "<C-c>", ":write<CR>", opts)
keymapset("n", "Q", ":quit<CR>", opts)
keymapset("n", "F", ":q!<CR>", opts)

-- Source file
keymapset("n", "<leader>o", ":update<CR>:source<CR>")

-- LSP
keymapset("n", "<leader>rn", vim.lsp.buf.rename, opts)
keymapset("n", "K", vim.lsp.buf.hover, opts)
keymapset({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
keymapset("n", "<leader>f", function()
  vim.lsp.buf.format { async = true }
end, opts)
keymapset("n", "<leader>rs", ":LspRestart<CR>", opts)
keymapset({ "i", "n" }, "<C-h>", vim.lsp.buf.signature_help, opts)

-- Nvim-tree
keymapset("n", "<leader>m", ":NvimTreeToggle<CR>", opts)
keymapset("n", "<leader>a", ":bprev<CR>", opts)
keymapset("n", "<leader>d", ":bnext<CR>", opts)
keymapset("n", "<leader>b", ":bdelete<CR>", opts)

-- Panel Nav
keymapset("n", "<leader>h", "<C-w>h", opts)
keymapset("n", "<leader>j", "<C-w>j", opts)
keymapset("n", "<leader>k", "<C-w>k", opts)
keymapset("n", "<leader>l", "<C-w>l", opts)

-- Indenting
keymapset("v", "<", "<gv", opts)
keymapset("v", ">", ">gv", opts)

-- Line moving
keymapset("n", "<A-J>", ":m .+1<CR>==", opts)     -- move line up
keymapset("n", "<A-K>", ":m .-2<CR>==", opts)     -- move line down
keymapset("v", "<A-J>", ":m '>+1<CR>gv=gv", opts) -- move selection down
keymapset("v", "<A-K>", ":m '<-2<CR>gv=gv", opts) -- move selection down
--
-- Neocodeium
keymapset("i", "<C-f>", function() require("neocodeium").accept() end)
keymapset("i", "<C-t>", function() require("neocodeium").accept_word() end)
keymapset("i", "<C-l>", function() require("neocodeium").accept_line() end)
keymapset("i", "<C-e>", function() require("neocodeium").cycle_or_complete() end)
keymapset("i", "<C-q>", function() require("neocodeium").cycle_or_complete(-1) end)
keymapset("n", "<C-x>", "<cmd>NeoCodeium toggle<CR>", opts)
keymapset("i", "<C-x>", "<Escape>:NeoCodeium toggle<CR>i<Right>",opts)

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
})

-----------------------------------------------------
--- PACKAGE SETUP
-----------------------------------------------------
require "stay-centered".setup({})
require "nvim-autopairs".setup({
  event = "InsertEnter",
})
require "tiny-inline-diagnostic".setup({
  priority = 1000,
  event = "LspAttach",
  vim.diagnostic.config({ virtual_text = false })
})

require "flow".setup({
  priority = 1000,
  dark_theme = true,
  high_contrast = false,
  fluo_color = "pink",
  transparent = false,
  mode = "bright",
  aggressive_spell = false,
})

require "lazydev".setup()

require "lualine".setup({
  options = {
    theme = "auto",
    globalstatus = true,
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      {
        "buffers",
      }
    },
  },
})

require "nvim-tree".setup({
  filters = {
    dotfiles = false,
  },
})
local neocodeium = require("neocodeium")
local lualine = require("lualine")
neocodeium.setup({
  silent = true,
  enabled = false,
})
lualine.setup({
  sections = {
    lualine_c = vim.list_extend(lualine.get_config().sections.lualine_c, {
      function()
        local status, _ = require("neocodeium").get_status()
        local status_symbols = {
          [0] = "󱜙  ON", -- Enabled
          [1] = "󱚧  OFF", -- Disabled Globally
          [2] = "󱚧  OFF", -- Disabled for Buffer (catch-all)
          [3] = "󱚧  OFF", -- Disabled for Buffer filetype
          [4] = "󱚧  OFF", -- Disabled Callback
          [5] = "󱚧  OFF", -- Disabled for Buffer encoding
        }

        return status_symbols[status]
      end,
    }),
  },
})
-----------------------------------------------------
--- MISC AND LSP
-----------------------------------------------------
vim.cmd.colorscheme "flow"
vim.lsp.enable({ "lua_ls", "clangd", "rust-analyzer", "pyright" })
