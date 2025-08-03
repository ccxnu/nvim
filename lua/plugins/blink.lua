return {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    -- dependencies = { "L3MON4D3/LuaSnip" },
    opts = {
        completion = {
            accept = {
                auto_brackets = {
                    enabled = false,
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
            },
        },
        keymap = {
            preset = "none",
            ["<C-p>"] = { "select_prev", "show" },
            ["<C-n>"] = { "select_next" },
            ["<C-d>"] = { "scroll_documentation_down", "fallback" },
            ["<C-U>"] = { "scroll_documentation_up", "fallback" },
            -- ["<CR>"] = { "accept" }, -- confirma y hace <Enter>
        },

        cmdline = { enabled = false },

        signature = { enabled = true },

        sources = { default = { "lsp", "buffer", "path", "snippets" } },

        snippets = { preset = "default" },
    },
}
