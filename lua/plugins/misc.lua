return {
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = { options = vim.opt.sessionoptions:get() },
    },
    {
        "shortcuts/no-neck-pain.nvim",
        version = "*",
        keys = {
            {
                "<Leader>zo",
                function()
                    require("no-neck-pain").toggle()
                end,
                desc = "Toggle NoNeckPain",
            },
        },
        opts = {
            width = 120,
            mappings = {
                enabled = true,
                toggle = "<Leader>zo",
            },
            buffers = {
                right = {
                    enabled = false,
                },
            },
        },
    },
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },

        init = function()
            local g = vim.g
            -- g.tmux_navigator_disable_when_zoomed = 1
            g.tmux_navigator_preserve_zoom = 1
        end,
    },
    {
        "eero-lehtinen/oklch-color-picker.nvim",
        version = "*",
        keys = {
            {
                "<leader>hi",
                function()
                    require("oklch-color-picker").pick_under_cursor()
                end,
                desc = "Color pick under cursor",
            },
        },
        opts = {},
    },
}
