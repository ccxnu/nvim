local function eslint_config_exists()
  local eslintrc = vim.fn.glob('.eslintrc*')
  return eslintrc ~= ''
end

return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      javascript = eslint_config_exists() and { 'eslint_d' } or {},
      typescript = eslint_config_exists() and { 'eslint_d' } or {},
      typescriptreact = eslint_config_exists() and { 'eslint_d' } or {},
      javascriptreact = eslint_config_exists() and { 'eslint_d' } or {},
      astro = eslint_config_exists() and { 'eslint_d' } or {},
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set('n', '<leader>i', function()
      lint.try_lint()
    end, { desc = 'Trigger linting for current file' })
  end,
}
