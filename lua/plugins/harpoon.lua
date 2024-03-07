return {
  'ThePrimeagen/harpoon',
  dependencies = {
    { 'nvim-lua/plenary.nvim', lazy = true },
  },
  event = 'VeryLazy',

  config = function()
    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')

    vim.keymap.set('n', '<leader>a', mark.add_file, { desc = 'Mark File' })
    vim.keymap.set('n', '<leader>o', ui.toggle_quick_menu, { desc = 'Menu' })

    vim.keymap.set('n', '<leader>h1', function()
      ui.nav_file(1)
    end, { desc = 'Move to mark 1' })
    vim.keymap.set('n', '<leader>h2', function()
      ui.nav_file(2)
    end, { desc = 'Move to mark 2' })
    vim.keymap.set('n', '<leader>h3', function()
      ui.nav_file(3)
    end, { desc = 'Move to mark 3' })
    vim.keymap.set('n', '<leader>h4', function()
      ui.nav_file(4)
    end, { desc = 'Move to mark 4' })
  end,
}
