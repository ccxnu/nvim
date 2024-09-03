-- Disable autoformatting for certain filetypes
vim.g.disable_lspformat = {
  bash = true,
  sh = true,
}
-- Disable autoformatting
-- vim.g.disable_autoformat = false

local formatters_by_ft = {
  -- typescript = { 'prettierd' },
  typescriptreact = { 'prettierd' },
  -- javascript = { 'prettierd' },
  javascriptreact = { 'prettierd' },
  json = { 'prettierd' },
  html = { 'prettierd' },
  css = { 'prettierd' },
  markdown = { 'prettierd' },
  yaml = { 'prettierd' },
  lua = { 'stylua' },
  python = { 'ruff' },
}

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  config = function()
    require('conform').setup({
      quiet = true,
      notify_on_error = false,
      -- set formatters by filetype
      formatters_by_ft = formatters_by_ft,
      format_on_save = function(bufnr)
        -- disable autoformat for files in a certain path
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match('/node_modules/') then
          return
        end

        -- disable autoformat
        -- if vim.g.disable_autoformat then
        --   return
        -- end

        return {
          timeout_ms = 200,
          lsp_fallback = false,
        }
      end,
    })

    -- create keymap to toggle autoformat
    -- vim.keymap.set('n', '<leader>fo', function()
    --   vim.g.disable_autoformat = not vim.g.disable_autoformat
    --   print('Toggle Formatting')
    -- end, {})
  end,
}
