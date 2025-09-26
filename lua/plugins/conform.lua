return {
    "stevearc/conform.nvim",
    event = { "BufReadPre" },
    keys = {
        -- stylua: ignore
        { "<leader>f", function() require("conform").format({ lsp_format = "fallback" }) end } ,
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            json = { "biome" },
            javascript = { "biome", "biome-organize-imports" },
            typescript = { "biome", "biome-organize-imports" },
            -- javascriptreact = { "biome", "biome-organize-imports" },
            -- typescriptreact = { "biome", "biome-organize-imports" },
            -- markdown   = { "biome" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
}
