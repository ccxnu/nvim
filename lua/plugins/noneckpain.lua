return {
  'shortcuts/no-neck-pain.nvim',
  version = '*',
  opts = {
    buffers = {
      right = {
        enabled = false,
      },
      scratchPad = {
        -- set to `false` to
        -- disable auto-saving
        enabled = true,
        -- set to `nil` to default
        -- to current working directory
        location = '~/Documents/Notes',
      },
      bo = {
        filetype = 'md',
      },
    },
  },
}
