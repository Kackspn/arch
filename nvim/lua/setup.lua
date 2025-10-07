------------------------------------------------------------
require "plugin-view".setup({})

------------------------------------------------------------
require "stay-centered".setup({})

------------------------------------------------------------
require "ibl".setup({
  indent = {
    smart_indent_cap = true,
    tab_char = "|",
  },
  scope = {
    enabled = false,
  },
})

------------------------------------------------------------
require "nvim-autopairs".setup({
  event = "InsertEnter",
})

------------------------------------------------------------
require "tiny-inline-diagnostic".setup({
  priority = 1000,
  event = "LspAttach",
  vim.diagnostic.config({ virtual_text = false })
})

------------------------------------------------------------
require "flow".setup({
  priority = 1000,
  dark_theme = true,
  high_contrast = false,
  transparent = true,
  fluo_color = "pink",
  mode = "bright",
  aggressive_spell = false,
})


------------------------------------------------------------
require "lazydev".setup()

------------------------------------------------------------
require "nvim-treesitter.configs".setup{
  auto_install = true,
  ensure_installed = {
    "c",
    "rust",
    "lua",
    "python",
    "lua",
  },
  ignore_install = {},
  sync_install = false,
  highlight = {
    enable = true,
    enabled = true,
    additional_vim_regex_highlighting = true,
  },
}

------------------------------------------------------------
require "lualine".setup({
 options = {
      theme = 'auto',
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
------------------------------------------------------------
require "nvim-tree".setup({
  filters = {
    dotfiles = false,
  },
})

------------------------------------------------------------
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

------------------------------------------------------------
require "telescope".setup({
  defaults = {
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        },
      },
    },
    pickers = {
      find_files = {
        theme = "dropdown",
        previewer = false,
        hidden = false,
      },
      live_grep = {
        theme = "dropdown",
        previewer = false,
      },
      find_buffers = {
        theme = "dropdown",
        previewer = false,
      },
    },
})
