require("core.autocmds")
require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        -- import any extras modules here
        { import = "plugins" }, -- loads all plugins in plugins/
    },
    rocks = {
        enabled = false,
    },
    change_detection = {
        notify = false,
    },
    performance = {
        cache = {
            enabled = true,
        },
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrw",
                "netrwPlugin",
                "netrwSettings",
                "netrwFileHandlers",
                "tar",
                "tarPlugin",
                "tohtml",
                "tutor",
                "2html_plugin",
                "getscript",
                "getscriptPlugin",
                "logipat",
                "rrhelper",
                "vimball",
                "vimballPlugin",
                "zip",
                "zipPlugin",
            },
        },
    },
})

vim.opt.runtimepath:append(vim.fn.expand("$HOME") .. "/Dev/rosebones")
vim.cmd.colorscheme("rosebones")
