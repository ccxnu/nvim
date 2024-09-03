return {
  {
    'christoomey/vim-tmux-navigator',
    keys = {
      { '<C-\\>', '<cmd>TmuxNavigatePrevious<cr>', desc = 'Go to the previous pane' },
      { '<C-h>', '<cmd>TmuxNavigateLeft<cr>', desc = 'Got to the left pane' },
      { '<C-j>', '<cmd>TmuxNavigateDown<cr>', desc = 'Got to the down pane' },
      { '<C-k>', '<cmd>TmuxNavigateUp<cr>', desc = 'Got to the up pane' },
      { '<C-l>', '<cmd>TmuxNavigateRight<cr>', desc = 'Got to the right pane' },
    },

    init = function()
      local g = vim.g
      -- g.tmux_navigator_disable_when_zoomed = 1
      g.tmux_navigator_preserve_zoom = 1
    end,
  },

  -- {
  --   'barrett-ruth/live-server.nvim',
  --   build = 'npm add -g live-server',
  --   cmd = { 'LiveServerStart', 'LiveServerStop' },
  --   config = true,
  -- },
}
