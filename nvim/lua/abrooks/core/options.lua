-- [[ Setting options ]]
-- See `:help vim.o`

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Set Buffer on Scroll
vim.o.scrolloff = 10

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.o.cursorline = true

vim.o.signcolumn = 'yes'

vim.o.backspace = 'indent,eol,start'

-- Always split to the right on Vertical Splits
vim.o.splitright = true
-- Always split to the bottom on horizontal splits
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
