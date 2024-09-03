return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup({
      keymaps = {
        ['<Esc>'] = {'actions.close'},
      }
    })
  end,
  opts = {
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    default_file_explorer = true,
    view_options = {
      show_hidden = false,
      is_hidden_file = function(name, _)
        return vim.startswith(name, '.')
      end,
    },
  },
}
