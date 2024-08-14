return {
  {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    dependencies = { 'folke/twilight.nvim' },
    opts = {

      window = { backdrop = 0.9, width = 100 },
      plugins = {
        gitsigns = false,
        tmux = false,
      },
    },
    keys = { { '<leader>z', '<cmd>ZenMode<cr>', desc = 'Zen Mode' } },
  },
}
