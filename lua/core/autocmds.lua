-----------------------------------------------------------
--- Variables
-----------------------------------------------------------

--- Define variables
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
local function augroup(name)
    return vim.api.nvim_create_augroup("nvimtraap_" .. name, { clear = true })
end

--- Highlight on yank
autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Enable Spell on txt, tex, md, vim, and sh files
autocmd("BufEnter", {
    pattern = { "*.txt", "*.tex", "*.bib", "*.md" },
    callback = function()
        vim.opt_local.spell = true
    end,
})

--- Don't auto commenting new lines
autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- -- WhiteSpace
-- autocmd("BufWritePre", {
--     command = [[%s/\s\+$//e]],
--     group = augroup("whitespace"),
-- })

--- Close with q
vim.api.nvim_create_autocmd({ "FileType" }, {
    desc = "Close some filetypes with <q>",
    pattern = {
        "PlenaryTestPopup",
        "TelescopePrompt",
        "checkhealth",
        "dap-repl",
        "FzfLua",
        "help",
        "lspinfo",
        "man",
        "nnn",
        "qf",
        "spectre_panel",
        "startuptime",
        "tsplayground",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close!<cr>", { buffer = event.buf, silent = true })
    end,
    group = augroup("close_with_q"),
})
