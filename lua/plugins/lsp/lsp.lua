return {
  'neovim/nvim-lspconfig', -- Main LSP plugin
  event = { 'BufReadPre', 'BufNewFile', 'BufReadPost' },
  dependencies = {
    { 'williamboman/mason.nvim', opts = {} },
    { 'williamboman/mason-lspconfig.nvim', opts = {} },
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local lspconfig = require('lspconfig')
    -- Function to configure keymaps and other LSP-specific behaviors
    local on_attach = function(_, bufnr)
      local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
      end

      -- LSP keymaps
      local opts = { noremap = true, silent = true }
      buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      buf_set_keymap('n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      buf_set_keymap('n', '<C-x>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
      buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    end

    -- List of LSP servers to configure
    local servers = {
      'texlab',
      'vtsls',
      'cssls',
      'lua_ls',
      'pyright',
    }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({
        on_attach = on_attach,
        vim.diagnostic.config({
          virtual_text = false,
        }),
      })
    end

    -- Specific configuration for Lua LSP server
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.stdpath('config') .. '/lua'] = true,
            },
          },
        },
      },
    })

    -- lspconfig.emmet_ls.setup({
    -- on_attach = on_attach,
    -- filetypes = { 'html', 'css', 'sass', 'scss', 'less', 'svelte', 'astro' },
    -- })

    lspconfig.vtsls.setup({
      root_dir = function(...)
        return require('lspconfig.util').root_pattern('.git', 'tsconfig.json')(...)
      end,
      on_attach = on_attach,
      single_file_support = false,
      settings = {
        typescript = {
          inlayHints = {
            enumMemberValues = { enabled = false },
            functionLikeReturnTypes = { enabled = false },
            parameterNames = { enabled = false },
            parameterTypes = { enabled = false },
            propertyDeclarationTypes = { enabled = false },
            variableTypes = { enabled = false },
          },
        },
        -- javascript = {
        --   inlayHints = {
        --     includeInlayParameterNameHints = 'all',
        --     includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        --     includeInlayFunctionParameterTypeHints = true,
        --     includeInlayVariableTypeHints = true,
        --     includeInlayPropertyDeclarationTypeHints = true,
        --     includeInlayFunctionLikeReturnTypeHints = true,
        --     includeInlayEnumMemberValueHints = true,
        --   },
        -- },
      },
    })

    -- lspconfig.gopls.setup({
    --   settings = {
    --     gopls = {
    --       hints = {
    --         assignVariableTypes = false,
    --         compositeLiteralFields = false,
    --         compositeLiteralTypes = false,
    --         constantValues = false,
    --         functionTypeParameters = false,
    --         parameterNames = false,
    --         rangeVariableTypes = false,
    --       },
    --     },
    --   },
    -- })

    -- lspconfig.tailwindcss.setup({
    --   on_attach = on_attach,
    --   root_dir = function(...)
    --     return require('lspconfig.util').root_pattern('tailwind.config.js', 'tailwind.config.cjs')(...)
    --   end,
    -- })
  end,
}
