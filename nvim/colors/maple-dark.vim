" Maple dark · subframe7536/vscode-theme-maple (MIT)
unlet! g:colors_name
set background=dark
highlight clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'maple-dark'

highlight Normal guifg=#cbd5e1 guibg=#1e1e1f gui=NONE ctermfg=188 ctermbg=234 cterm=NONE
highlight Cursor guifg=#1e1e1f guibg=#8d9db4 gui=NONE ctermfg=234 ctermbg=109 cterm=NONE
highlight CursorLine guifg=NONE guibg=#282c32 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
highlight Visual guifg=#cbd5e1 guibg=#475569 gui=NONE ctermfg=188 ctermbg=240 cterm=NONE
highlight Search guifg=#cbd5e1 guibg=#404e39 gui=NONE ctermfg=188 ctermbg=238 cterm=NONE
highlight IncSearch guifg=#1e1e1f guibg=#d5f288 gui=bold ctermfg=234 ctermbg=192 cterm=bold
highlight MatchParen guifg=#b8d7f9 guibg=#475569 gui=bold ctermfg=153 ctermbg=240 cterm=bold
highlight LineNr guifg=#747475 guibg=NONE gui=NONE ctermfg=243 ctermbg=NONE cterm=NONE
highlight CursorLineNr guifg=#fafafa guibg=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
highlight SignColumn guifg=NONE guibg=#1e1e1f gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE
highlight NonText guifg=#44444b guibg=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
highlight VertSplit guifg=#44444b guibg=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
highlight StatusLine guifg=#cbd5e1 guibg=#171718 gui=NONE ctermfg=188 ctermbg=234 cterm=NONE
highlight StatusLineNC guifg=#999999 guibg=#171718 gui=NONE ctermfg=246 ctermbg=234 cterm=NONE
highlight Pmenu guifg=#cbd5e1 guibg=#232a39 gui=NONE ctermfg=188 ctermbg=236 cterm=NONE
highlight PmenuSel guifg=#cbd5e1 guibg=#334155 gui=NONE ctermfg=188 ctermbg=238 cterm=NONE
highlight Folded guifg=#999999 guibg=#232a39 gui=NONE ctermfg=246 ctermbg=236 cterm=NONE
highlight ColorColumn guifg=NONE guibg=#232a39 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
highlight Comment guifg=#999999 guibg=NONE gui=NONE ctermfg=246 ctermbg=NONE cterm=NONE
highlight Constant guifg=#f0c0a8 guibg=NONE gui=NONE ctermfg=217 ctermbg=NONE cterm=NONE
highlight String guifg=#a4dfae guibg=NONE gui=NONE ctermfg=151 ctermbg=NONE cterm=NONE
highlight Number guifg=#d5f288 guibg=NONE gui=NONE ctermfg=192 ctermbg=NONE cterm=NONE
highlight Boolean guifg=#d2ccff guibg=NONE gui=NONE ctermfg=189 ctermbg=NONE cterm=NONE
highlight Identifier guifg=#eecfa0 guibg=NONE gui=NONE ctermfg=223 ctermbg=NONE cterm=NONE
highlight Function guifg=#8fc7ff guibg=NONE gui=NONE ctermfg=117 ctermbg=NONE cterm=NONE
highlight Statement guifg=#d2ccff guibg=NONE gui=NONE ctermfg=189 ctermbg=NONE cterm=NONE
highlight PreProc guifg=#e3cbeb guibg=NONE gui=NONE ctermfg=253 ctermbg=NONE cterm=NONE
highlight Type guifg=#f0c0a8 guibg=NONE gui=NONE ctermfg=217 ctermbg=NONE cterm=NONE
highlight Special guifg=#8fc7ff guibg=NONE gui=NONE ctermfg=117 ctermbg=NONE cterm=NONE
highlight Delimiter guifg=#b8d7f9 guibg=NONE gui=NONE ctermfg=153 ctermbg=NONE cterm=NONE
highlight Operator guifg=#b8d7f9 guibg=NONE gui=NONE ctermfg=153 ctermbg=NONE cterm=NONE
highlight Tag guifg=#edabab guibg=NONE gui=NONE ctermfg=217 ctermbg=NONE cterm=NONE
highlight Title guifg=#d2ccff guibg=NONE gui=bold ctermfg=189 ctermbg=NONE cterm=bold
highlight Todo guifg=#d5f288 guibg=#232a39 gui=bold ctermfg=192 ctermbg=236 cterm=bold
highlight Underlined guifg=#8fc7ff guibg=NONE gui=underline ctermfg=117 ctermbg=NONE cterm=underline
highlight ErrorMsg guifg=#edabab guibg=NONE gui=NONE ctermfg=217 ctermbg=NONE cterm=NONE
highlight WarningMsg guifg=#eecfa0 guibg=NONE gui=NONE ctermfg=223 ctermbg=NONE cterm=NONE
highlight DiagnosticInfo guifg=#8fc7ff guibg=NONE gui=NONE ctermfg=117 ctermbg=NONE cterm=NONE
highlight DiagnosticHint guifg=#8dbe74 guibg=NONE gui=NONE ctermfg=108 ctermbg=NONE cterm=NONE
highlight DiffAdd guifg=#cbd5e1 guibg=#39453c gui=NONE ctermfg=188 ctermbg=237 cterm=NONE
highlight DiffDelete guifg=#cbd5e1 guibg=#473a3b gui=NONE ctermfg=188 ctermbg=237 cterm=NONE
highlight DiffChange guifg=#cbd5e1 guibg=#282c32 gui=NONE ctermfg=188 ctermbg=236 cterm=NONE
highlight DiffText guifg=#cbd5e1 guibg=#475569 gui=NONE ctermfg=188 ctermbg=240 cterm=NONE
highlight! link EndOfBuffer NonText
highlight! link WinSeparator VertSplit
highlight! link NormalFloat Pmenu
highlight! link FloatBorder VertSplit
highlight! link CursorColumn CursorLine
highlight! link TabLine StatusLineNC
highlight! link TabLineSel PmenuSel
highlight! link TabLineFill StatusLine
highlight! link SpecialKey NonText
highlight! link Error ErrorMsg
highlight! link DiagnosticError ErrorMsg
highlight! link DiagnosticWarn WarningMsg
highlight! link Character String
highlight! link Float Number
highlight! link Keyword Statement
highlight! link StorageClass Statement

if has('nvim')
  highlight! link @variable Identifier
  highlight! link @variable.parameter Identifier
  highlight! link @variable.member MapleProperty
  highlight! link @property MapleProperty
  highlight! link @type.builtin Statement
  highlight! link @tag Tag
  highlight! link @punctuation Delimiter
  highlight! link @markup.heading Title
  highlight! link @markup.raw String
endif
highlight MapleProperty guifg=#ded6cf guibg=NONE gui=NONE ctermfg=188 ctermbg=NONE cterm=NONE

" Keep the same palette dictionary across lightline ColorScheme events.
if exists('g:lightline') && get(g:lightline, 'colorscheme', '') ==# 'maple'
  let s:bar = ['#cbd5e1', '#171718', 188, 234]
  let s:p = {'normal': {'left': [['#1e1e1f', '#8fc7ff', 234, 117], s:bar], 'right': [s:bar], 'middle': [s:bar]}}
  let s:p.insert = {'left': [['#1e1e1f', '#a4dfae', 234, 151], s:bar]}
  let s:p.visual = {'left': [['#1e1e1f', '#d2ccff', 234, 189], s:bar]}
  let s:p.replace = {'left': [['#1e1e1f', '#edabab', 234, 217], s:bar]}
  let s:p.inactive = {'left': [s:bar], 'right': [s:bar], 'middle': [s:bar]}
  let s:p.tabline = {'left': [s:bar], 'right': [s:bar], 'middle': [s:bar], 'tabsel': s:p.normal.left}
  if exists('g:lightline#colorscheme#maple#palette')
    call extend(g:lightline#colorscheme#maple#palette, s:p)
  else
    let g:lightline#colorscheme#maple#palette = s:p
  endif
endif

let g:terminal_ansi_colors = ['#333333','#edabab','#a4dfae','#eecfa0','#8fc7ff','#d2ccff','#a1e8e5','#f3f2f2','#666666','#ffc4c4','#bdf8c7','#ffe8b9','#a8e0ff','#ebe5ff','#bafffe','#ffffff']
if has('nvim')
  for s:i in range(16)
    let g:terminal_color_{s:i} = g:terminal_ansi_colors[s:i]
  endfor
endif
