local servers = { "biome", "texlab", "vtsls", "lua_ls", "gopls", "pylsp" }

-- Función que se ejecuta al adjuntar el LSP a un buffer
-- stylua: ignore
local function on_attach(_, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "<leader>xx",   vim.diagnostic.open_float,      opts)
    vim.keymap.set("n", "[d",           vim.diagnostic.goto_prev,       opts)
    vim.keymap.set("n", "]d",           vim.diagnostic.goto_next,       opts)
    vim.keymap.set("n", "gd",           vim.lsp.buf.definition,         opts)
    vim.keymap.set("n", "gD",           vim.lsp.buf.declaration,        opts)
    -- vim.keymap.set("n", "K",            vim.lsp.buf.hover,              opts) -- Default K
    -- vim.keymap.set("n", "<leader>gn",   vim.lsp.buf.rename,             opts) -- Default grn
    -- vim.keymap.set("n", "<leader>ga",   vim.lsp.buf.code_action,        opts) -- Default gra
    -- vim.keymap.set("n", "gr",           vim.lsp.buf.references,         opts) -- Default grr
    -- vim.keymap.set("n", "gi",           vim.lsp.buf.implementation,     opts) -- Default gri
    -- vim.keymap.set("n", "<leader>D",    vim.lsp.buf.type_definition,    opts) -- Default grt
    -- vim.keymap.set("n", "<leader>bo",   vim.lsp.buf.document_symbol,    opts) -- Default gO
    -- vim.keymap.set("n", "<C-k>",        vim.lsp.buf.signature_help,     opts) -- Default <C-s> on Insert
end

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile", "BufReadPost" },
    dependencies = { "williamboman/mason.nvim" },
    config = function()
        require("mason").setup()
        local lspconfig = require("lspconfig")
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        vim.diagnostic.config({
            virtual_text = false,
            signs = true,
            update_in_insert = false,
            underline = true,
            float = {
                show_header = false,
                source = "if_many",
                border = "rounded",
                focusable = false,
            },
        })

        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
        end

        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })

        lspconfig.pylsp.setup({
            settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = {
                            enabled = true,
                            ignore = { "E501", "E231" },
                            maxLineLength = 120,
                        },
                    },
                },
            },
        })
    end,
}
