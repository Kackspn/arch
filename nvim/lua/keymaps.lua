local keymapset = vim.keymap.set
local opts = { silent = true, noremap = true }
-- Save/exit commands
keymapset("n", "C", ":write<CR>", opts)
keymapset("i", "<C-c>", "<Escape>:write<CR>", opts)
keymapset("n", "<C-c>", ":write<CR>", opts)
keymapset("n", "Q", ":quit<CR>", opts)
keymapset("n", "F", ":q!<CR>", opts)

-- Source file
keymapset("n", "<leader>o", ":update<CR>:source<CR>")

-- Nvim-tree
keymapset("n", "<leader>m", ":NvimTreeToggle<CR>", opts)
keymapset("n", "<leader>a", ":bprev<CR>", opts)
keymapset("n", "<leader>d", ":bnext<CR>", opts)
keymapset("n", "<leader>b", ":bdelete<CR>", opts)
keymapset({"i", "n"}, "<C-l>", ":bnext<CR>", opts)
keymapset({"i", "n"}, "<C-h>", ":bprev<CR>", opts)

-- Panel Nav
keymapset("n", "<leader>h", "<C-w>h", opts)
keymapset("n", "<leader>j", "<C-w>j", opts)
keymapset("n", "<leader>k", "<C-w>k", opts)
keymapset("n", "<leader>l", "<C-w>l", opts)
keymapset("n", "<leader>sv", ":vsplit<CR>", opts)
keymapset("n", "<leader>sh", ":split<CR>", opts)

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

-- Telescope
keymapset("n", "<leader>fk", ":Telescope keymaps<CR>")
keymapset("n", "<leader>fh", ":Telescope help_tags<CR>")
keymapset("n", "<leader>ff", ":Telescope find_files<CR>")
keymapset("n", "<leader>fa", ":Telescope <CR>")
keymapset("n", "<leader>fg", ":Telescope live_grep<CR>")
keymapset("n", "<leader>fb", ":Telescope buffers<CR>")

-- LSP
keymapset("n", "<leader>rn", vim.lsp.buf.rename, opts)
keymapset("n", "K", vim.lsp.buf.hover, opts)
keymapset({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
keymapset("n", "<leader>F", function()
  vim.lsp.buf.format { async = true }
end, opts)
keymapset("n", "<leader>gd", vim.lsp.buf.definition, opts)
keymapset("n", "<leader>gD", vim.lsp.buf.declaration, opts)
keymapset("n", "<leader>rs", ":LspRestart<CR>", opts)
keymapset({ "i", "n" }, "<C-s>", vim.lsp.buf.signature_help, opts)
