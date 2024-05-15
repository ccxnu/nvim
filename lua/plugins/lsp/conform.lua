return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require('conform')

    conform.setup({
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
        quiet = false, -- not recommended to change
      },
      formatters_by_ft = {
        -- javascript = { 'prettier' },
        -- typescript = { 'prettier' },
        -- javascriptreact = { 'prettier' },
        -- typescriptreact = { 'prettier' },
        -- css = { 'prettier' },
        -- html = { 'prettier' },
        -- json = { 'prettier' },
        -- yaml = { 'prettier' },
        -- markdown = { 'prettier' },
        javascript = { 'prettierd' },
        typescript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        css = { 'prettierd' },
        html = { 'prettierd' },
        json = { 'prettierd' },
        yaml = { 'prettierd' },
        markdown = { 'prettierd' },
        lua = { 'stylua' },
      },
    })
  end,
}
