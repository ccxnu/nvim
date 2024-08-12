return {
  {
    'OXY2DEV/markview.nvim',
    enabled = true,
    opts = {
      checkboxes = { enable = false },
      links = {
        inline_links = {
          hl = '@markup.link.label.markown_inline',
          icon = ' ',
          icon_hl = '@markup.link',
        },
        images = {
          hl = '@markup.link.label.markown_inline',
          icon = ' ',
          icon_hl = '@markup.link',
        },
      },
      code_blocks = {
        style = 'language',
        hl = 'CodeBlock',
        pad_amount = 2,
      },
      list_items = {
        shift_width = 2,
        marker_minus = { text = '•', hl = '@markup.list.markdown' },
        marker_plus = { text = '•', hl = '@markup.list.markdown' },
        marker_star = { text = '•', hl = '@markup.list.markdown' },
        marker_dot = {},
      },
      inline_codes = { enable = false },
      headings = {
        heading_1 = { style = 'simple', hl = 'Headline1' },
        heading_2 = { style = 'simple', hl = 'Headline2' },
        heading_3 = { style = 'simple', hl = 'Headline3' },
        heading_4 = { style = 'simple', hl = 'Headline4' },
        heading_5 = { style = 'simple', hl = 'Headline5' },
        heading_6 = { style = 'simple', hl = 'Headline6' },
      },
    },

    ft = { 'markdown', 'norg', 'rmd', 'org' },
  },

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

  {
    'barrett-ruth/live-server.nvim',
    build = 'npm add -g live-server',
    cmd = { 'LiveServerStart', 'LiveServerStop' },
    config = true,
  },
}
