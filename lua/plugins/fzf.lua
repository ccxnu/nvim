return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- stylua: ignore
  keys = {
    { ';f', function() require('fzf-lua').files() end, },
    { ';r', function() require('fzf-lua').live_grep() end, },
    { ';h', function() require('fzf-lua').oldfiles() end, },
  },

  config = function()
    -- calling `setup` is optional for customization
    require('fzf-lua').setup({
      live_grep = { cmd = 'rg -E node_modules' },
    })
  end,
}
