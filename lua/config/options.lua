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
opt.cursorline = true -- Enable highlighting of the current line
vim.opt.colorcolumn = '80'

-- Window settings
opt.splitright = true
opt.splitbelow = true

-- Spell settings
opt.spelllang = { 'en', 'es' }
opt.spell = false

-- Status
opt.conceallevel = 0 -- Nothing in hidden
opt.swapfile = false -- creates a swap file
opt.backup = false -- creates a backup file
opt.showmode = false
opt.showtabline = 0

-- Identation
opt.tabstop = 2 -- A TAB character looks like 4 spaces
opt.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
opt.shiftwidth = 2 -- Number of spaces inserted when indenting
opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
opt.smartindent = true
opt.showbreak = string.rep(' ', 2)

-- Undo, search
opt.undofile = true
opt.undolevels = 10000
opt.incsearch = true

opt.scrolloff = 5
opt.signcolumn = 'yes'
opt.isfname:append('@-@')
opt.updatetime = 50

-- Folding
opt.fillchars = { fold = ' ' }
opt.foldmethod = 'indent'
opt.foldenable = false
opt.foldlevel = 99

opt.syntax = 'off'
