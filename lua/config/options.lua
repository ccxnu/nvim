local opt = vim.opt
local g = vim.g

-- Leader keys
g.mapleader = ' '
g.maplocalleader = ','

-- Basic settings
opt.nu = true
opt.relativenumber = true
opt.termguicolors = true
opt.clipboard = 'unnamedplus' -- Sync with system clipboard
opt.mouse = '' -- Disable mouse mode
opt.colorcolumn = '80'

-- Window settings
opt.splitright = true -- Put new windows right of current
opt.splitbelow = true

-- Spell settings
opt.spell = false

-- Status
opt.conceallevel = 0 -- Nothing in hidden
opt.swapfile = false -- creates a swap file
opt.backup = false -- creates a backup file
opt.showmode = false -- show current mode
opt.cmdheight = 0 -- Height of the command bar, it appears when needed
--opt.showtabline = 0 -- Hide tabs

-- Identation
opt.tabstop = 2 -- A TAB character looks like 2 spaces
opt.shiftwidth = 2 -- Number of spaces inserted when indenting
opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character

-- Disable indent features
vim.cmd('filetype plugin indent off')
vim.cmd('filetype indent off')

-- Undo
opt.undofile = true
opt.undolevels = 10000

-- Search
opt.incsearch = true
opt.smartcase = true

opt.scrolloff = 3
opt.signcolumn = 'yes'
opt.isfname:append('@-@')
opt.updatetime = 50

-- Fold
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldmethod = 'indent' -- indent, expr
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
