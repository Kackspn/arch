local o = vim.opt

o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.smartindent = true
o.wrap = false
o.autoindent = true

o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.hlsearch = true

o.number = true
o.relativenumber = true
o.termguicolors = true
o.cmdheight = 1
o.completeopt = "menuone,noinsert,noselect"
o.fillchars = { eob = " " }
o.cursorline = true
o.winborder = 'rounded'

o.hidden = true
o.errorbells = false
o.swapfile = false
o.backup = false
o.undodir = vim.fn.expand("~/.vim/undodir")
o.undofile = true
o.backspace = "indent,eol,start"
o.splitright = true
o.splitbelow = true
o.autochdir = false
o.iskeyword:append("-")
o.path:append("**")
o.mouse:append('a')
o.clipboard = "unnamedplus"
o.modifiable = true
o.encoding = "UTF-8"

vim.g.mapleader = " "
