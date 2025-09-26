return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    event = "VeryLazy",
    otps = {
        ensure_installed = { "lua", "json" },
        auto_install = false, -- Autoinstall languages that are not installed
        highlight = {
            enable = true, -- false will disable the whole extension
            use_languagetree = true,
            disable = { "latex", "tex" }, -- list of language that will be disabled
        },
        indent = { enable = false },
    },
}
