return {
    "ibhagwan/fzf-lua",
    -- stylua: ignore
    keys = {
        { ";f", function() require("fzf-lua").files({ fzf_args = "--exact" }) end, },
        { ";r", function() require("fzf-lua").live_grep({}) end, },
        { ";h", function() require("fzf-lua").oldfiles() end, },
    },
    opts = {},
    config = function()
        require("fzf-lua").setup({
            "default",

            defaults = {
                file_icons = false,
            },
        })
    end,
}
