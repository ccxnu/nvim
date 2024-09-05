return {
  'lukas-reineke/indent-blankline.nvim',
  ft = { 'python', 'yaml' },
  main = 'ibl',
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    scope = {
      show_start = false,
      show_end = false,
    },
  },
}
