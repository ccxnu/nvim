----------------------------------------------------------
--- Variables
-----------------------------------------------------------

local map = vim.keymap.set

-- local discipline = require('me.discipline')
-- discipline.cowboy()
local opts = { noremap = true, silent = true }

-----------------------------------------------------------
--- Keymaps
-----------------------------------------------------------
-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Buffer to full screen
map("n", "<leader>ra", "<C-w>_<C-w>|", { desc = "full si[z]e" })
map("n", "<leader>ro", "<C-w>=", { desc = "even si[Z]e" })

-- Coding
map("i", "{<CR>", "{<CR>}<Esc>O", opts)

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<leader>l", "<CMD>Lazy<CR>", { desc = "Open Lazy", noremap = true, silent = true })
map("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open Filesystem", noremap = true, silent = true }) -- Oil
map("n", "<leader>wo", "<CMD>Markview toggle<CR>", { desc = "Toggle Markview", noremap = true, silent = true }) -- Oil

-- Increment|drecement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Correcting spelling mistakes on the fly: https://castel.dev/post/lecture-notes-1/
map("i", "<C-l>", "<C-g>u<Esc>[s1z=`]a<C-g>u", opts)

-- Select All
--map('n', '<C-a>', 'gg<S-v>G')
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- New pane on vertical and close
map("n", "<leader>\\", ":vsplit<CR>")
map("n", "<leader>-", ":split<CR>")
map("n", "<leader>d", ":close<CR>")

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
