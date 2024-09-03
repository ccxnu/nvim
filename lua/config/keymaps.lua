----------------------------------------------------------
--- Variables
-----------------------------------------------------------

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local discipline = require('me.discipline')
discipline.cowboy()

-----------------------------------------------------------
--- Keymaps
-----------------------------------------------------------
-- better up/down
-- map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- map({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

map('n', '<leader>l', '<CMD>Lazy<CR>', opts)
map('n', '<leader>e', '<CMD>Oil<CR>', { desc = 'Open Filesystem' })                 -- Oil
map('n', '<leader>su', '<CMD>SupermavenToggle<CR>', { desc = 'Toggle Supermaven' }) -- Supermaven

-- Increment|drecement
map('n', '+', '<C-a>')
map('n', '-', '<C-x>')

-- New tab
map('n', 'te', ':tab split<CR>', opts)
map('n', '<tab>', ':tabnext<Return>', opts)
map('n', '<s-tab>', ':tabprev<Return>', opts)

-- Select All
map('n', '<C-a>', 'gg<S-v>G')
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- New pane on vertical and close
map('n', '<leader>\\', ':vsplit<CR>', opts)
map('n', '<leader>-', ':split<CR>', opts)
map('n', '<leader>d', ':close<CR>', opts)

-- Resize window
map('n', '<s-Left>', '<C-w><')
map('n', '<s-Right>', '<C-w>>')
map('n', '<s-Up>', '<C-w>+')
map('n', '<s-Down>', '<C-w>-')

-- Move to window using the <ctrl> hjkl keys
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
