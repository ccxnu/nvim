return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    local logo = [[
        |\      _,,,---,,_
    ZZZzz /,`.-'`'    -.  ;-;;,_
        |,4-  ) )-,_. ,\ (  `'-'
        '---''(_/--'  `-'\_)  Nonyoo
    ]]
    logo = string.rep('\n', 8) .. logo .. '\n\n'

    require('dashboard').setup({
      -- config
      theme = 'doom',
      config = {
        header = vim.split(logo, '\n'),
        center = {
          { action = 'Telescope find_files', desc = ' Find file', icon = ' ', key = 'f' },
          { action = 'Telescope live_grep', desc = ' Find text', icon = ' ', key = 'g' },
          { action = 'Telescope oldfiles', desc = ' Recent files', icon = ' ', key = 'r' },
          { action = 'Lazy', desc = ' Lazy', icon = '󰒲 ', key = 'l' },
          { action = 'qa', desc = ' Quit', icon = ' ', key = 'q' },
        },
        footer = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
        end,
      },
    })
  end,
}
