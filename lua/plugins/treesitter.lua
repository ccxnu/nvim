return { -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'lua', 'xml', 'http', 'json' },
        auto_install = true, -- Autoinstall languages that are not installed
        highlight = {
          enable = true, -- false will disable the whole extension
          disable = { 'markdown', 'c', 'cpp', 'bash' }, -- list of language that will be disabled
        },
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
