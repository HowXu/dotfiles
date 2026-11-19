-- Maple · subframe7536/vscode-theme-maple (MIT; see LICENSE-maple)
local variant = 'dark' -- 'dark' or 'light'

local palettes = {
   dark = {
      fg = '#cbd5e1',
      bg = '#1e1e1f',
      selection = '#475569',
      bar = '#171718',
      hover = '#2d3a4b',
      border = '#64748b',
      ansi = { '#333333', '#edabab', '#a4dfae', '#eecfa0', '#8fc7ff', '#d2ccff', '#a1e8e5', '#f3f2f2' },
      brights = { '#666666', '#ffc4c4', '#bdf8c7', '#ffe8b9', '#a8e0ff', '#ebe5ff', '#bafffe', '#ffffff' },
   },
   light = {
      fg = '#475569',
      bg = '#fffffe',
      selection = '#e1e7dc',
      bar = '#fafaf9',
      hover = '#e9efe3',
      border = '#94a3b8',
      ansi = { '#333333', '#bd5151', '#547000', '#b26b1f', '#057d9e', '#726293', '#127d52', '#f3f2f2' },
      brights = { '#666666', '#bd5151', '#547000', '#b26b1f', '#057d9e', '#726293', '#127d52', '#ffffff' },
   },
}

local p = palettes[variant]
local blue = p.ansi[5]
return {
   foreground = p.fg,
   background = p.bg,
   cursor_bg = p.fg,
   cursor_border = p.fg,
   cursor_fg = p.bg,
   selection_bg = p.selection,
   selection_fg = p.fg,
   ansi = p.ansi,
   brights = p.brights,
   tab_bar = {
      background = p.bar,
      active_tab = { bg_color = blue, fg_color = p.bg },
      inactive_tab = { bg_color = p.bar, fg_color = p.fg },
      inactive_tab_hover = { bg_color = p.hover, fg_color = p.fg },
      new_tab = { bg_color = p.bar, fg_color = p.fg },
      new_tab_hover = { bg_color = p.hover, fg_color = blue, italic = true },
   },
   visual_bell = p.hover,
   scrollbar_thumb = p.selection,
   split = p.border,
   compose_cursor = p.ansi[6],
}
