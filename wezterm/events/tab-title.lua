local wezterm = require('wezterm')

local M = {}
local __cells__ = {}

local tabs = require('colors.maple').tab_bar

local _push = function(bg, fg, attr, text)
   table.insert(__cells__, { Background = { Color = bg } })
   table.insert(__cells__, { Foreground = { Color = fg } })
   table.insert(__cells__, { Attribute = attr })
   table.insert(__cells__, { Text = text })
end

local _process_name = function(s)
   if not s or s == '' then return '' end
   local a = string.gsub(s, '(.*[/\\])(.*)', '%2')
   return (a:gsub('%.exe$', ''))
end

M.setup = function()
   wezterm.on('format-tab-title', function(tab, _tabs, _panes, _config, hover, max_width)
      __cells__ = {}

      local style = tab.is_active and tabs.active_tab or (hover and tabs.inactive_tab_hover or tabs.inactive_tab)
      local bg, fg = style.bg_color, style.fg_color

      local process_name = _process_name(tab.active_pane.foreground_process_name)
      local pane_title = tab.active_pane.title or ''

      local content
      if #pane_title > 0 then
         content = pane_title
      elseif #process_name > 0 then
         content = process_name
      else
         content = 'shell'
      end

      _push(bg, fg, { Intensity = 'Bold' }, '  ')
      _push(bg, fg, { Intensity = 'Bold' }, content)
      _push(bg, fg, { Intensity = 'Bold' }, '  ')

      return __cells__
   end)
end

return M
