return {
  'ccxnu/rosebones',
  lazy = false,
  priority = 1000,
  opts = {
    style = 'default', -- The theme comes in two styles: default(dark) & day(light).
    light_style = 'day', -- The theme is used when the background is set to light
    transparent = true, -- Enable this to disable setting the background color
    terminal_colors = false, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value for `:help nvim_set_hl`
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
    },

    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = false, -- dims inactive windows
  },
}
