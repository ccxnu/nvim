return {
    "lervag/vimtex",
    ft = { "tex", "bib" },
    init = function()
        vim.g.vimtex_log_ignore = {
            "Underfull",
            "Overfull",
            "specifier changed to",
            "Token not allowed in a PDF string",
        }
        vim.g.tex_flavor = "latex"
        vim.g.vimtex_quickfix_mode = 0

        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_quickfix_mode = 0
        vim.opt.conceallevel = 0
        vim.g.tex_conceal = "abdmg"

        vim.g.vimtex_fold_enabled = 0
        vim.g.vimtex_quickfix_open_on_warning = 0

        -- Añadir compilador con backend biber
        vim.g.vimtex_compiler_method = "latexmk"
        vim.g.vimtex_compiler_latexmk = {
            build_dir = "",
            callback = 1,
            continuous = 1,
            executable = "latexmk",
            options = {
                "-pdf",
                "-pdflatex=pdflatex",
                "-interaction=nonstopmode",
                "-synctex=1",
                "-shell-escape",
            },
        }
    end,
}
