return {
  'williamboman/mason.nvim',
  --no lazy loading
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    -- import mason
    local mason = require('mason')

    -- import mason-lspconfig
    local mason_lspconfig = require('mason-lspconfig')

    local mason_tool_installer = require('mason-tool-installer')

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        'tsserver',
        'html',
        'cssls',
        'tailwindcss',
        'lua_ls',
        'emmet_ls', -- { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" } --> See lspconfig.lua
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_tool_installer.setup({
      ensure_installed = {
        'prettierd', -- prettier formatter
        'stylua', -- lua formatter
        'eslint_d', -- js linter
      },
    })
  end,
}
