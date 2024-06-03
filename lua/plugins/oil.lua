return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup({ keymaps = { ['<Esc>'] = 'actions.close' } })
  end,
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = false,
      is_hidden_file = function(name, _)
        return vim.startswith(name, '.')
      end,
    },
  },
}
