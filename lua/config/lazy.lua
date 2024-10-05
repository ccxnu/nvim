require('config.options')
require('config.keymaps')
require('config.autocmds')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
    { import = 'plugins.lsp' }, -- Load lsp
  },
  defaults = {
    lazy = true, -- plugins are not lazy loaded by default
  },
  change_detection = {
    notify = false,
  },
  rtp = {
    disabled_plugins = {
      'gzip',
      'matchit',
      'matchparen',
      'netrw',
      'netrwPlugin',
      'netrwSettings',
      'netrwFileHandlers',
      'tar',
      'tarPlugin',
      'tohtml',
      'tutor',
      '2html_plugin',
      'getscript',
      'getscriptPlugin',
      'logipat',
      'rrhelper',
      'spellfile_plugin',
      'vimball',
      'vimballPlugin',
      'zip',
      'zipPlugin',
    },
  },
})

vim.cmd.colorscheme('rosebones')
