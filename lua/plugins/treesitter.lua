return { -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    enabled = true,
    opts = { mode = 'cursor', max_lines = 3 },
    keys = {
      {
        '<leader>ut',
        function()
          require('treesitter-context').toggle()
        end,
        desc = 'Toggle Treesitter Context',
      },
    },
  },
}
