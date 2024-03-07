return {
  'ibhagwan/fzf-lua',
  event = 'VeryLazy',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- stylua: ignore
  keys = {
    { ';f', function() require('fzf-lua').files() end, },
    { ';r', function() require('fzf-lua').live_grep() end, },
    { ';b', function() require('fzf-lua').buffers() end, },
    { ';t', function() require('fzf-lua').tabs() end, },
    { ';h', function() require('fzf-lua').help_tags() end, },
    { ';;', function() require('fzf-lua').resume() end, },
    { ';d', function() require('fzf-lua').diagnostics_workspace() end, },
  },

  config = function()
    -- calling `setup` is optional for customization
    require('fzf-lua').setup({})
  end,
}
