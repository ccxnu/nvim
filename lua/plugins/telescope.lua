return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  lazy = true,
  event = 'VeryLazy',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
  },
    -- stylua: ignore
  keys = {
      { ";f", function() require("telescope.builtin").find_files({ no_ignore = false, hidden = true }) end,
        desc = "Lists files in your current working directory, respects .gitignore", },
      { ";r", function() require("telescope.builtin").live_grep() end,
        desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore", },
      { ";b", function() require("telescope.builtin").buffers() end,
        desc = "Lists open buffers", },
      { ";h", function() require("telescope.builtin").help_tags() end,
        desc = "Lists available help tags and opens a new window with the relevant help info on <cr>", },
      { ";;", function() require("telescope.builtin").resume() end,
        desc = "Resume the previous telescope picker", },
      { ";d", function() require("telescope.builtin").diagnostics() end,
        desc = "Lists Diagnostics for all open buffers or a specific buffer", },
    },
  config = function()
    local telescope = require('telescope')
    telescope.setup()

    telescope.load_extension('fzf')
    telescope.load_extension('file_browser')
  end,
}
