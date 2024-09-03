return {
  {
    'echasnovski/mini.comment',
    version = false,
    keys = { 'gcc', { 'gc', mode = 'v' } },
    opts = {},
  },

  {
    'danymat/neogen',
    keys = {
      { '<Leader>na', ':lua require("neogen").generate()<CR>', desc = 'Generate comments' },
    },
      config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
}
