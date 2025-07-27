local config = function ()

  require("lualine").setup({
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
end

return {
  "nvim-lualine/lualine.nvim",
  config = config,
  lazy = false,
}
