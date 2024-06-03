return {
  'hrsh7th/nvim-cmp',
  event = { 'InsertEnter' },
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-emoji',
    'onsails/lspkind.nvim',
  },
  config = function()
    local cmp = require('cmp')
    vim.g.cmp_toggle = false

    vim.keymap.set('n', '<Leader>co', function()
      vim.g.cmp_toggle = not vim.g.cmp_toggle
      local status
      if vim.g.cmp_toggle then
        status = 'ENABLED'
      else
        status = 'DISABLED'
      end
      print('Completion', status)
    end)

    cmp.setup({
      sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'emoji' },
        { name = 'path' },
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      preselect = cmp.PreselectMode.None,
      mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm(),
      },
      formatting = {
        format = require('lspkind').cmp_format(),
      },
      enabled = function()
        return vim.g.cmp_toggle
      end,
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
    })
  end,
}
