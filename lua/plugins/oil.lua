return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup({ keymaps = { ['<Esc>'] = 'actions.close' } })
  end,
  keys = {
    { '<Leader>e', '<cmd>Oil<cr>', mode = 'n', desc = 'Open Filesystem' },
  },
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
  },
}
