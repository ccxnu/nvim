local servers = { "biome", "texlab", "vtsls", "lua_ls" }

local lua_lsp_settings = {
    Lua = {
        runtime = { version = "LuaJIT" },
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
}

local on_attach = function(_, bufnr)
    local map = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = bufnr, noremap = true, silent = true, desc = desc })
    end

    map("gd", vim.lsp.buf.definition, "LSP: Go to Definition")
    map("gD", vim.lsp.buf.declaration, "LSP: Go to Declaration")
    map("<leader>xx", vim.diagnostic.open_float, "LSP: Show Line Diagnostics")

    -- grn        -> renames all references of the symbol under the cursor
    -- gra        -> list code actions available in the line under the cursor
    -- grr        -> lists all the references of the symbol under the cursor
    -- gri        -> lists all the implementations for the symbol under the cursor
    -- gO         -> lists all symbols in the current buffer
    -- ctrl-s     -> in insert mode, display function signature under the cursor
    -- [d         -> jump to previous diagnostic in the current buffer
    -- ]d         -> jump to next diagnostic in the current buffer
    -- ctrl-w + d -> show error/warning message in the line under the cursor
end

local on_init = function(client, _)
    if client:supports_method("textDocument/semanticTokens") then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile", "BufReadPost" },
    dependencies = { "williamboman/mason.nvim" },
    config = function()
        require("mason").setup()
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                on_attach(_, args.buf)
            end,
        })

        vim.lsp.config("*", {
            capabilities = capabilities,
            on_init = on_init,
        })

        vim.lsp.config("lua_ls", { settings = lua_lsp_settings })

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

        vim.lsp.enable(servers)
    end,
}
