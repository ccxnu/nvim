return {
  'hrsh7th/nvim-cmp',
  event = { 'InsertEnter' },
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
  },
  config = function()
    local cmp = require('cmp')
    cmp.setup({
      sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm(),
      },
    })
  end,
}
