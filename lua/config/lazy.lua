require('config.options')
require('config.keymaps')
require('config.autocmds')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  spec = {
    -- import any extras modules here
    { import = 'plugins' }, -- loads all plugins in plugins/
  },
  defaults = {
    lazy = false, -- plugins are not lazy loaded by default
  },
  ui = {
    border = 'rounded',
  },
  change_detection = {
    notify = false,
  },
  rtp = {
    disabled_plugins = {
      'gzip',
      'matchit',
      'matchparen',
   --   "netrwPlugin",
      'tarPlugin',
      'tohtml',
      'tutor',
      'zipPlugin',
    },
  },
})

vim.cmd.colorscheme('rose-pine')
