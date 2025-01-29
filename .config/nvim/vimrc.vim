syntax on
set mouse=a
set number
set relativenumber
filetype indent on
set wildmenu
set showmatch
set ruler
set noswapfile
set hlsearch
set incsearch
set autoindent
set expandtab
set ts=2 sw=2
set formatoptions-=cro
set splitbelow
set timeoutlen=250
set linebreak
"autocmd FileType * set formatoptions-=cro ts=2 sw=2 expandtab
"set nowrap
"set cursorline
"set cursorcolumn
"set iskeyword-=_,-
set termguicolors

" //TabLine//
highlight TabLine guibg=#330000 guifg=#CC0000
highlight TabLineSel guibg=#CC0000 guifg=#000000
highlight TabLineFill guibg=#000000 guifg=#330000

" //StatusLine//
set noshowmode
set laststatus=3
let g:isInsert = ''

function! IsModified()
    if &modified
        return ''
    else
        return ' '
    endif
endfunction
function! ModeName()
  let mode_dict = {'n': 'NORMAL', 'i': 'INSERT', 'v': 'VISUAL', 'V': 'V-LINE', "\<C-V>": 'V-BLOCK', 'R': 'REPLACE', 's': 'SELECT', 'S': 'S-LINE', "\<C-S>": 'S-BLOCK', 't': 'TERMINAL', 'c': 'COMMAND'}
  return get(mode_dict, mode(), 'UNKNOWN')
endfunction

highlight StatusLine guibg=#CC0000 guifg=#000000 gui=bold
highlight StatusLineArrow guibg=#200000 guifg=#CC0000
highlight StatusLineNC guibg=#900000 guifg=#000000 gui=bold
highlight StatusLineNCArrow guibg=#160000 guifg=#900000
highlight StatusLineInfo guibg=#220000 guifg=#990000 gui=none
highlight StatusLineInfoMain guibg=#220000 guifg=#EE0000 gui=bold
highlight StatusLineNCInfo guibg=#160000 guifg=#600000 gui=none
highlight StatusLineNCInfoMain guibg=#160000 guifg=#A00000 gui=bold

set statusline=%#StatusLine#\ %{ModeName()}%{IsModified()}%#StatusLineArrow#%{eval('g:isInsert')}\ %#StatusLineInfo#%<%{expand('%:p:h')}/%#StatusLineInfoMain#%{expand('%:t:r')}.%{expand('%:e')}\ %#StatusLineInfo#%=%h%r%w[%n][%c:%l][%p%%/%L]
augroup StatusLineChange
  autocmd!
  autocmd InsertEnter * let g:isInsert = ''
  autocmd InsertLeave * let g:isInsert = ' '
  autocmd WinEnter * setlocal statusline=%#StatusLine#\ %{ModeName()}%{IsModified()}%#StatusLineArrow#%{eval('g:isInsert')}\ %#StatusLineInfo#%<%{expand('%:p:h')}/%#StatusLineInfoMain#%{expand('%:t:r')}.%{expand('%:e')}\ %#StatusLineInfo#%=%h%r%w[%n][%c:%l][%p%%/%L]
	autocmd WinLeave * setlocal statusline=%#StatusLineNC#\ %{ModeName()}%{IsModified()}%#StatusLineNCArrow#\ %#StatusLineNCInfo#%<%{expand('%:p:h')}/%#StatusLineNCInfoMain#%{expand('%:t:r')}.%{expand('%:e')}\ %#StatusLineNCInfo#%=%h%r%w[%n][%c:%l][%p%%/%L]
augroup END

" //Highlights//
highlight Normal guibg=none guifg=#CC0000 gui=none
highlight NormalNC guibg=none guifg=#CC0000 gui=none
highlight Comment guibg=none guifg=#770000 gui=none
highlight Include guibg=none guifg=#D00000 gui=none
highlight Define guibg=none guifg=#D00000 gui=underline
highlight Bold guibg=none guifg=#D00000 gui=bold
highlight Constant guibg=none guifg=#CC0000 gui=none
highlight Conditional guibg=none guifg=#D00000 gui=underline
highlight NonText guibg=none guifg=#880000 gui=none
highlight Error guifg=#FF0000 guibg=#600000 gui=bold,underline
highlight Number guibg=none guifg=#FF0000 gui=bold
highlight Float guibg=none guifg=#FF0000 gui=bold
highlight String guibg=none guifg=#990000 gui=none
highlight Delimiter guibg=none guifg=#770000 gui=none
highlight Function guibg=none guifg=#CC0000 gui=none
highlight Special guibg=none guifg=#CC0000 gui=none
highlight Statement guibg=none guifg=#FF0000 gui=bold
highlight Identifier guibg=none guifg=#DD0000 gui=bold
highlight LineNr guibg=none guifg=#D00000
highlight LineNrAbove guibg=none guifg=#800000 gui=none
highlight LineNrBelow guibg=none guifg=#800000 gui=none
highlight Todo guibg=#D00000 guifg=#600000
highlight WildMenu guibg=none guifg=#D00000
highlight MatchParen guibg=#600000 guifg=#FF0000 gui=bold
highlight Visual guibg=#440000 guifg=#FF0000 gui=none
highlight Repeat guibg=none guifg=#D00000 gui=bold
highlight IncSearch guibg=#600000 guifg=#FF0000 gui=underline
highlight Search guibg=#300000 guifg=#BB0000 gui=underline
highlight CurSearch guibg=#600000 guifg=#FF0000 gui=underline
highlight SpecialKey guibg=none guifg=#D00000 gui=none
highlight PreProc guibg=none guifg=#D00000 gui=none
highlight Operator guibg=none guifg=#990000 gui=none
highlight Type guibg=none guifg=#CC0000 gui=none
highlight Conditional guibg=none guifg=#D00000 gui=bold
highlight Title guibg=none guifg=#FF0000 gui=bold
highlight Boolean guibg=none guifg=#FF0000 gui=bold
highlight Cursor guibg=none guifg=#D00000
highlight CursorLine guibg=#300000
highlight CursorLineFold guibg=none guifg=#600000 gui=none
highlight CursorLineNr guibg=none guifg=none gui=none
highlight CursorColumn guibg=#202020
highlight Folded guibg=none guifg=#440000 gui=bold
highlight FoldColumn guibg=none guifg=#D00000 gui=none
highlight SignColumn guibg=none guifg=#D00000
highlight Pmenu guibg=none guifg=#D00000
highlight PmenuSel guibg=#D00000 guifg=#000000
highlight PmenuSbar guibg=none guifg=#D00000
highlight PmenuThumb guibg=#D00000 guifg=none
highlight Directory guibg=none guifg=#770000
highlight VertSplit guibg=none guifg=#600000
highlight ErrorMsg guibg=#600000 guifg=#D00000
highlight ModeMsg guibg=none guifg=#D00000 gui=underline
highlight MoreMsg guibg=none guifg=#EE0000 gui=underline
highlight DiffAdd guibg=none guifg=#00BF00 gui=none
highlight DiffChange guibg=none guifg=#FFFF00 gui=none
highlight DiffDelete guibg=none guifg=#880000 gui=none
highlight DiffText guibg=#3F3F00 guifg=#FFFF00 gui=none
highlight SpellBad guibg=#600000 guifg=#D00000 gui=underline
highlight Underlined guibg=none guifg=#D00000 gui=underline
highlight NormalFloat guibg=none
highlight WinActive guibg=#D00000 guifg=#000000 gui=bold
highlight WinInactive guibg=#300000 guifg=#D00000
highlight! link WinNeighbor WinInactive
highlight @variable guibg=none guifg=#CC0000 gui=none
highlight QuickFixLine guibg=#400000 guifg=#D00000 gui=none
highlight markdownCode guibg=#330000 guifg=#FF0000 gui=none
highlight markdownCodeBlock guibg=#220000 guifg=#CC0000 gui=none

" //GITSIGNS//
 highlight GitSignsAdd guifg=#D00000
 highlight GitSignsChange guifg=#600000
 highlight GitSignsDelete guifg=#D00000
 highlight GitSignsAddLn guibg=#202020
 highlight GitSignsChangeLn guibg=#202020

" //DIAGNOSTICS//
highlight DiagnosticError guibg=#300000 guifg=#D00000
highlight DiagnosticWarn guibg=#300000 guifg=#ff7f7f
highlight DiagnosticInfo guifg=#ffbf7f
highlight DiagnosticHint guibg=#301818 guifg=#A00000 gui=italic

highlight DiagnosticSignError guibg=none guifg=#D00000
highlight DiagnosticSignWarn guibg=none guifg=#D00000
highlight! link DiagnosticSignInfo DiagnosticInfo
highlight! link DiagnosticSignHint DiagnosticHint

highlight DiagnosticUnderlineError guibg=none guifg=none guisp=#A00000
highlight DiagnosticUnderlineWarn guibg=none guifg=none guisp=#ff7f7f
highlight DiagnosticUnderlineHint guibg=none guifg=none guisp=#A00000
