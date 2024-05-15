return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
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
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    keys = {
      -- ZenMode
      vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<cr>', { silent = true }),
      desc = 'Zenmode',
    },
    opts = {
      window = {
        backdrop = 0.90, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        width = 100, -- width of the Zen window
        height = 1, -- height of the Zen window
      },
    },
  },

  {
    'barrett-ruth/live-server.nvim',
    build = 'npm add -g live-server',
    cmd = { 'LiveServerStart', 'LiveServerStop' },
    config = true,
  },

  {
    'lervag/vimtex',
    ft = { 'tex' },
    config = function()
      vim.api.nvim_create_autocmd({ 'FileType' }, {
        group = vim.api.nvim_create_augroup('lazyvim_vimtex_conceal', { clear = true }),
        pattern = { 'bib', 'tex' },
        callback = function()
          vim.wo.conceallevel = 0
        end,
      })

      vim.g.vimtex_quickfix_open_on_warning = 1

      vim.g.vimtex_log_ignore = {
        'Underfull',
        'Overfull',
        'specifier changed to',
        'Token not allowed in a PDF string',
      }
      vim.g.vimtex_view_general_viewer = 'zathura'
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_quickfix_mode = 0
    end,
  },

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
