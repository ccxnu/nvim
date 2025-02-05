return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    init = function()
        local logo = [[
        |\      _,,,---,,_
    ZZZzz /,`.-'`'    -.  ;-;;,_
         |,4-  ) )-,_. ,\ (  `'-'
          '---''(_/--'  `-'\_)  ccxnu
    ]]
        logo = string.rep("\n", 8) .. logo .. "\n\n"

        require("dashboard").setup({
            -- config
            theme = "doom",
            config = {
                header = vim.split(logo, "\n"),
                -- stylua: ignore
                center = {
                    -- { action = 'FzfLua files', desc = ' Find file', icon = ' ', key = 'f' },
                    -- { action = 'FzfLua live_grep', desc = ' Find text', icon = ' ', key = 'g' },
                    -- { action = 'FzfLua oldfiles', desc = ' Recent files', icon = ' ', key = 'r' },
                    { action = 'lua require("persistence").load()',desc = " Restore Session", icon = " ", key = "s" },
                    { action = 'Lazy', desc = ' Lazy', icon = '󰒲 ', key = 'l' },
                    { action = 'qa', desc = ' Quit', icon = ' ', key = 'q' },
                },
                footer = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
                end,
            },
        })
    end,
}
