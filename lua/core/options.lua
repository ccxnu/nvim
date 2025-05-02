local opt = vim.opt
local g = vim.g

-- Leader keys
g.mapleader = vim.keycode("<space>")
g.maplocalleader = vim.keycode(",")

-- Basic settings
opt.nu = true -- Line of numbers
opt.syntax = "off" -- Text color by regex
opt.termguicolors = true
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.mouse = "" -- Disable mouse mode
opt.colorcolumn = "80" -- Column in the middle of the screen
g.syntastic_auto_jump = 0 -- Don't jump on saving

-- Window settings
opt.splitright = true -- Put new windows right of current
opt.splitbelow = true -- Put new windows below of current

-- Spell settings
opt.spelllang = { "es", "en" } -- Languages to check spell
opt.spell = false -- Don't use spell by default

-- Status
opt.conceallevel = 0 -- Hides code blocks symbols and simplify links [0,1,2,3]
opt.swapfile = false -- Creates a swap file
opt.backup = false -- Creates a backup file
opt.showmode = false -- Show current mode
opt.cmdheight = 0 -- Height of the command bar, it appears when needed
--opt.showtabline = 0                 -- Hide tabs

-- Identation
opt.tabstop = 4 -- A TAB character looks like 2 spaces
opt.shiftwidth = 4 -- Number of spaces inserted when indenting
opt.softtabstop = 4
opt.autoindent = false
opt.smartindent = false
opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character

-- Undo
opt.undofile = true
opt.undolevels = 10000

-- Search
opt.incsearch = true
opt.smartcase = true

--opt.scrolloff = 0                 -- Minimal number of screen lines to keep above and below the cursor. 999 to center.
--opt.sidescrolloff = 8             -- minimal number of screen lines to keep left and right of the cursor.
opt.signcolumn = "yes" -- Line in the left of number line, space
-- opt.isfname:append('@-@')        -- Allow files names with '@'.
opt.updatetime = 50

-- Fold
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldmethod = "indent" -- indent, expr
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Show whitespaces
vim.opt.list = false
vim.opt.listchars = { space = "·", trail = "⋅", tab = "→·" }

-- Netrw
g.loaded_netrwPlugin = 0
g.loaded_netrw = 0
