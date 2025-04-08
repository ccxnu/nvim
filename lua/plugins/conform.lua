return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                cs = { "csharpier" },
                lua = { "stylua" },
                -- css = { "prettier" },
                -- go = { "gofmt" },
                -- html = { "prettier" },
                -- javascript = { "prettier" },
                -- json = { "prettier" },
                -- markdown = { "prettier" },
                python = { "ruff" },
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 5000,
            })
        end)
    end,
}
