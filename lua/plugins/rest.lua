return {
  {
    'vhyrro/luarocks.nvim',
    lazy = true,
    opts = {
      rocks = { 'lua-curl', 'nvim-nio', 'mimetypes', 'xml2lua' }, -- Specify LuaRocks packages to install
    },
  },

  {
    'rest-nvim/rest.nvim',
    ft = 'http',
    keys = { { '<leader>ra', '<cmd>Rest run<cr>' } },
    dependencies = { 'luarocks.nvim' },
    config = function()
      require('rest-nvim').setup()
    end,
  },
}
