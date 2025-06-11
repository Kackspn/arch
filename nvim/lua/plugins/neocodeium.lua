return {
  "monkoose/neocodeium",
  lazy = false,
  config = function()
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

  end,
}

