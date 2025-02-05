return { -- Highlight, edit, and navigate code
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "VeryLazy",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "xml", "http", "json" },
                auto_install = false, -- Autoinstall languages that are not installed
                highlight = {
                    enable = true, -- false will disable the whole extension
                    -- disable = { 'c', 'cpp', 'bash' }, -- list of language that will be disabled
                },
                indent = { enable = false },
            })
        end,
    },
}
