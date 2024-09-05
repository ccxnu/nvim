return {
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
