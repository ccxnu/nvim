return {
  'lervag/vimtex',
  ft = { 'tex', 'bib' },
  config = function()
    vim.g.vimtex_fold_enabled = 0
    vim.g.vimtex_quickfix_open_on_warning = 0

    vim.g.vimtex_log_ignore = {
      'Underfull',
      'Overfull',
      'specifier changed to',
      'Token not allowed in a PDF string',
    }
    vim.g.vimtex_compiler_latexmk = {
      options = {
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-shell-escape',
        '-interaction=nonstopmode',
      },
    }
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_quickfix_mode = 0
  end,
}
