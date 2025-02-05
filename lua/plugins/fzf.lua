return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- stylua: ignore
    keys = {
        { ";f", function() require("fzf-lua").files({ fzf_args = "--exact" }) end, },
        { ";r", function() require("fzf-lua").live_grep({}) end, },
        { ";h", function() require("fzf-lua").oldfiles() end, },
    },
}
