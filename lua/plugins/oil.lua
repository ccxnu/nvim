return {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    config = function()
        require("oil").setup({
            keymaps = {
                ["<Esc>"] = { "actions.close" },
            },
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            default_file_explorer = true,
            columns = {},
            view_options = {
                show_hidden = false,
                is_hidden_file = function(name, _)
                    return vim.startswith(name, ".") or vim.endswith(name, "obj") or vim.endswith(name, "bin")
                end,
            },
        })
    end,
}
