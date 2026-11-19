" Maple light · subframe7536/vscode-theme-maple (MIT)
unlet! g:colors_name
set background=light
highlight clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'maple-light'

highlight Normal guifg=#475569 guibg=#fffffe gui=NONE ctermfg=240 ctermbg=231 cterm=NONE
highlight Cursor guifg=#fffffe guibg=#6e7e95 gui=NONE ctermfg=231 ctermbg=66 cterm=NONE
highlight CursorLine guifg=NONE guibg=#f7f8f4 gui=NONE ctermfg=NONE ctermbg=255 cterm=NONE
highlight Visual guifg=#475569 guibg=#e1e7dc gui=NONE ctermfg=240 ctermbg=254 cterm=NONE
highlight Search guifg=#475569 guibg=#dae0d7 gui=NONE ctermfg=240 ctermbg=253 cterm=NONE
highlight IncSearch guifg=#fffffe guibg=#739900 gui=bold ctermfg=231 ctermbg=64 cterm=bold
highlight MatchParen guifg=#71a3a8 guibg=#e1e7dc gui=bold ctermfg=73 ctermbg=254 cterm=bold
highlight LineNr guifg=#a6a6a6 guibg=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
highlight CursorLineNr guifg=#1d1d1d guibg=NONE gui=bold ctermfg=234 ctermbg=NONE cterm=bold
highlight SignColumn guifg=NONE guibg=#fffffe gui=NONE ctermfg=NONE ctermbg=231 cterm=NONE
highlight NonText guifg=#cdd4dc guibg=NONE gui=NONE ctermfg=188 ctermbg=NONE cterm=NONE
highlight VertSplit guifg=#cdd4dc guibg=NONE gui=NONE ctermfg=188 ctermbg=NONE cterm=NONE
highlight StatusLine guifg=#475569 guibg=#fafaf9 gui=NONE ctermfg=240 ctermbg=231 cterm=NONE
highlight StatusLineNC guifg=#808080 guibg=#fafaf9 gui=NONE ctermfg=244 ctermbg=231 cterm=NONE
highlight Pmenu guifg=#475569 guibg=#ffffff gui=NONE ctermfg=240 ctermbg=231 cterm=NONE
highlight PmenuSel guifg=#475569 guibg=#e1e7db gui=NONE ctermfg=240 ctermbg=254 cterm=NONE
highlight Folded guifg=#808080 guibg=#ffffff gui=NONE ctermfg=244 ctermbg=231 cterm=NONE
highlight ColorColumn guifg=NONE guibg=#ffffff gui=NONE ctermfg=NONE ctermbg=231 cterm=NONE
highlight Comment guifg=#808080 guibg=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
highlight Constant guifg=#c37522 guibg=NONE gui=NONE ctermfg=136 ctermbg=NONE cterm=NONE
highlight String guifg=#478f14 guibg=NONE gui=NONE ctermfg=64 ctermbg=NONE cterm=NONE
highlight Number guifg=#739900 guibg=NONE gui=NONE ctermfg=64 ctermbg=NONE cterm=NONE
highlight Boolean guifg=#726293 guibg=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE
highlight Identifier guifg=#aa830e guibg=NONE gui=NONE ctermfg=136 ctermbg=NONE cterm=NONE
highlight Function guifg=#0585a8 guibg=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=NONE
highlight Statement guifg=#726293 guibg=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE
highlight PreProc guifg=#a65973 guibg=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
highlight Type guifg=#c37522 guibg=NONE gui=NONE ctermfg=136 ctermbg=NONE cterm=NONE
highlight Special guifg=#0585a8 guibg=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=NONE
highlight Delimiter guifg=#71a3a8 guibg=NONE gui=NONE ctermfg=73 ctermbg=NONE cterm=NONE
highlight Operator guifg=#71a3a8 guibg=NONE gui=NONE ctermfg=73 ctermbg=NONE cterm=NONE
highlight Tag guifg=#bd5151 guibg=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
highlight Title guifg=#726293 guibg=NONE gui=bold ctermfg=60 ctermbg=NONE cterm=bold
highlight Todo guifg=#739900 guibg=#ffffff gui=bold ctermfg=64 ctermbg=231 cterm=bold
highlight Underlined guifg=#0585a8 guibg=NONE gui=underline ctermfg=31 ctermbg=NONE cterm=underline
highlight ErrorMsg guifg=#bd5151 guibg=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
highlight WarningMsg guifg=#aa830e guibg=NONE gui=NONE ctermfg=136 ctermbg=NONE cterm=NONE
highlight DiagnosticInfo guifg=#0585a8 guibg=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=NONE
highlight DiagnosticHint guifg=#85987c guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
highlight DiffAdd guifg=#475569 guibg=#dae9cf gui=NONE ctermfg=240 ctermbg=253 cterm=NONE
highlight DiffDelete guifg=#475569 guibg=#f2dcdb gui=NONE ctermfg=240 ctermbg=224 cterm=NONE
highlight DiffChange guifg=#475569 guibg=#f7f8f4 gui=NONE ctermfg=240 ctermbg=255 cterm=NONE
highlight DiffText guifg=#475569 guibg=#e1e7dc gui=NONE ctermfg=240 ctermbg=254 cterm=NONE
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
highlight MapleProperty guifg=#8d8949 guibg=NONE gui=NONE ctermfg=101 ctermbg=NONE cterm=NONE

" Keep the same palette dictionary across lightline ColorScheme events.
if exists('g:lightline') && get(g:lightline, 'colorscheme', '') ==# 'maple'
  let s:bar = ['#475569', '#fafaf9', 240, 231]
  let s:p = {'normal': {'left': [['#fffffe', '#0585a8', 231, 31], s:bar], 'right': [s:bar], 'middle': [s:bar]}}
  let s:p.insert = {'left': [['#fffffe', '#478f14', 231, 64], s:bar]}
  let s:p.visual = {'left': [['#fffffe', '#726293', 231, 60], s:bar]}
  let s:p.replace = {'left': [['#fffffe', '#bd5151', 231, 131], s:bar]}
  let s:p.inactive = {'left': [s:bar], 'right': [s:bar], 'middle': [s:bar]}
  let s:p.tabline = {'left': [s:bar], 'right': [s:bar], 'middle': [s:bar], 'tabsel': s:p.normal.left}
  if exists('g:lightline#colorscheme#maple#palette')
    call extend(g:lightline#colorscheme#maple#palette, s:p)
  else
    let g:lightline#colorscheme#maple#palette = s:p
  endif
endif

let g:terminal_ansi_colors = ['#333333','#bd5151','#547000','#b26b1f','#057d9e','#726293','#127d52','#f3f2f2','#666666','#bd5151','#547000','#b26b1f','#057d9e','#726293','#127d52','#ffffff']
if has('nvim')
  for s:i in range(16)
    let g:terminal_color_{s:i} = g:terminal_ansi_colors[s:i]
  endfor
endif
