return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- This config function is the designated place for all setup logic.

    local lspconfig = require("lspconfig")
    -- Load server configurations from your modular files.
    -- These calls will set up the autocommands to launch the servers on filetype.
    lspconfig.lua_ls.setup(require("lsp.lua_ls"))
    lspconfig.clangd.setup(require("lsp.clangd"))
    lspconfig.rust_analyzer.setup(require("lsp.rust-analyzer"))
    lspconfig.pyright.setup(require("lsp.pyright"))

    -- (Optional but Recommended) Add global keymappings for LSP features
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf, noremap = true, silent = true }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set({'i', 'n'}, '<C-h>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })
  end,
}
