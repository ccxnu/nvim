return {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = { -- set to setup table
        filetypes = { "*" }, -- Filetype options.  Accepts table like `user_default_options`
        user_default_options = {
            names = false, -- "Name" codes like Blue or red.
            rgb_fn = true, -- CSS rgb() and rgba() functions
            hsl_fn = true, -- CSS hsl() and hsla() functions
            mode = "background", -- Set the display mode
        },
    },
}
