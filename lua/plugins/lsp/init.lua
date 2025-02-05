local servers = {
    "texlab",
    "vtsls",
    "lua_ls",
    "omnisharp",
}

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile", "BufReadPost" },
    dependencies = { "williamboman/mason.nvim" },
    config = function()
        require("mason").setup()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup({
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
                }),
            })
        end

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
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

        lspconfig.omnisharp.setup({
            capabilities = capabilities,
            cmd = {
                vim.fn.expand("$HOME") .. "/.local/share/nvim/mason/bin/omnisharp",
                "--languageserver",
                "--hostPID",
                tostring(vim.fn.getpid()),
            },
            root_dir = function(fname)
                local primary = lspconfig.util.root_pattern("*.sln")(fname)
                local fallback = lspconfig.util.root_pattern("*.csproj")(fname)
                return primary or fallback
            end,
            settings = {
                FormattingOptions = {
                    OrganizeImports = true,
                },
                RoslynExtensionsOptions = {
                    EnableAnalyzersSupport = true,
                    AnalyzeOpenDocumentsOnly = true,
                    EnableImportCompletion = true,
                },
                Sdk = {
                    IncludePrereleases = true,
                },
            },
        })

        -- lspconfig.gopls.setup({
        -- 	capabilities = capabilities,
        -- 	settings = {
        -- 		gopls = {
        -- 			analyses = {
        -- 				unusedparams = true,
        -- 			},
        -- 			staticcheck = true,
        -- 			templateExtensions = { "gohtml" },
        -- 		},
        -- 	},
        -- })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local bufnr = args.buf
                local opts = { noremap = true, silent = true, buffer = bufnr }
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if not client then
                    return
                end

                vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
                vim.keymap.set("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
                vim.keymap.set("n", "<leader>bo", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
                vim.keymap.set("n", "<leader>xx", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
                vim.keymap.set("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
                vim.keymap.set(
                    "n",
                    "<leader>wl",
                    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
                    opts
                )
                vim.keymap.set("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
                vim.keymap.set("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
                vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
                vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
                vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
                vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
                vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
                vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    callback = function()
                        require("conform").format({ bufnr = bufnr })
                    end,
                })
            end,
        })
    end,
}
