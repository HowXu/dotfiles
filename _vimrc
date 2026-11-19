" 真彩色
if has('termguicolors')
  set termguicolors
endif
" leader为空格键
let mapleader = " "
set encoding=UTF-8
" 系统剪切板
set clipboard=unnamedplus
" 去掉冒号
set fillchars=eob:\ 
" 禁用宏录制
nnoremap q <Nop>
"显示行数Enable line numbers
set number
"根据上一行缩进位置，自动缩行
set autoindent
"当点击tab键时缩进2个空格；Indent by 2 spaces when hitting tab
set softtabstop=2
"自动缩进时缩进4个空格； Indent by 4 spaces when auto-indenting
set shiftwidth=4
"以4个空格键显示Tab键Show existing tab with 4 spaces width
set tabstop=4
set wildmenu
"更现代的缓冲区策略以修复光标抖动
set ttyfast

" 自动补全设置
set nobackup
set nowritebackup
" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
" 在Alacritty上 SmoothCursor的表现会受到下面值的影响 调高一点会让表现更好
set updatetime=5000

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" I like block cursor
" 设置插入模式为块状
let &t_SI = "\<Esc>[2 q"
" 设置普通模式为块状
let &t_EI = "\<Esc>[2 q"

filetype indent on  "根据文件类型，加载缩进文件

" 插件安装
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
  Plug 'cohama/lexima.vim'
  Plug 'itchyny/lightline.vim'
  " Plug 'joshdick/onedark.vim'
  Plug 'tribela/vim-transparent'
  Plug 'sheerun/vim-polyglot'
  Plug 'sainnhe/sonokai'
  Plug 'dense-analysis/ale'
  Plug 'luochen1990/rainbow'
  " LSP和自动补全
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " WakaTime
  Plug 'wakatime/vim-wakatime'
  " github theme
  Plug 'cormacrelf/vim-colors-github'
call plug#end()

" Tree快捷键
nnoremap <C-n> :NERDTreeFocus<CR>
nnoremap <leader>e :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Which key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=20

" 状态栏
set laststatus=2
let g:lightline = {
\  'colorscheme': 'maple',
\}

" 语法匹配
syntax on
" 主题设置
let g:sonokai_style = "andromeda"
let g:sonokai_better_performance = 1

let g:github_colors_soft = 1
let g:github_colors_block_diffmark = 1
" Use the bundled themes when this vimrc is linked directly to dotfiles.
let s:maple_runtime = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/vim'
if isdirectory(s:maple_runtime . '/colors')
  execute 'set runtimepath^=' . fnameescape(s:maple_runtime)
endif
colorscheme maple-dark

" ALE Settings
" 彻底关闭 lint 功能（所有触发条件都设为 never）
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter       = 0
let g:ale_lint_on_save        = 0
let g:ale_lint_on_filetype_changed = 0

" （可选）打开保存时自动格式化
let g:ale_fix_on_save = 1

" 指定各语言的格式化工具（按需添加）
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'python':     ['black'],
\   'rust':       ['rustfmt'],
\   'lua':        ['stylua'],
\   'c':          ['clang-format'],
\   'cpp':        ['clang-format'],
\   'html':       ['prettier'],
\   'css':        ['prettier'],
\}

nnoremap <leader>f :ALEFix<CR>

" 彩虹括号设置
let g:rainbow_active = 1

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
" 用 Tab 确认选中的补全项（取代默认的 Enter）
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#confirm() :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" 最大可见设置小一点好看
set pumheight=8