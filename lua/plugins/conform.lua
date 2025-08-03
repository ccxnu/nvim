vim.g.formatters = { "stylua", "biome", "ruff" }

return {
    "stevearc/conform.nvim",
    event = { "BufReadPre" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ lsp_format = "fallback" })
            end,
        },
    },
    opts = {
        formatters_by_ft = {
            -- yaml       = { "biome" },
            lua = { "stylua" },
            json = { "biome" },
            javascript = { "biome", "biome-organize-imports" },
            javascriptreact = { "biome", "biome-organize-imports" },
            typescript = { "biome", "biome-organize-imports" },
            typescriptreact = { "biome", "biome-organize-imports" },
            -- markdown   = { "biome" },
            -- html       = { "biome" },
            -- css        = { "biome" },
            -- sh         = { "shfmt" },
            -- tex        = { "latexindent" },
            -- cmake      = { "cmake_format" },
            python = {
                exe = "ruff",
                args = {
                    "--fix",
                    "--stdin-filename",
                    vim.api.nvim_buf_get_name(0),
                },
                stdin = true,
            },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
}
