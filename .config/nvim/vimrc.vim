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
" set autoindent
set expandtab
set ts=2 sw=2
" set formatoptions-=cro
set splitbelow
set timeoutlen=250
set linebreak
autocmd FileType * set formatoptions-=cro ts=2 sw=2 expandtab
" set nowrap
" set cursorline
" set cursorcolumn
"set iskeyword-=_,-
set termguicolors

" //StatusLine//
set noshowmode
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

highlight SLMode guibg=#D00000 guifg=#000000 gui=bold
highlight SLArrow guibg=#200000 guifg=#D00000
highlight SLOMode guibg=#900000 guifg=#000000 gui=bold
highlight SLOArrow guibg=#160000 guifg=#900000
highlight SLInfo guibg=#200000 guifg=#800000 gui=none
highlight SLInfoMain guibg=#200000 guifg=#D00000 gui=bold
highlight SLOInfo guibg=#160000 guifg=#600000 gui=none
highlight SLOInfoMain guibg=#160000 guifg=#A00000 gui=bold

set statusline=%#SLMode#\ %{ModeName()}%{IsModified()}%#SLArrow#%{eval('g:isInsert')}\ %#SLInfo#%<%{expand('%:p:h')}/%#SLInfoMain#%{expand('%:t:r')}.%{expand('%:e')}\ %#SLInfo#%=%h%r%w[%n][%c:%l][%p%%/%L]
augroup SLChange
  autocmd!
  autocmd InsertEnter * let g:isInsert = ''
  autocmd InsertLeave * let g:isInsert = ' '
  autocmd WinEnter * setlocal statusline=%#SLMode#\ %{ModeName()}%{IsModified()}%#SLArrow#%{eval('g:isInsert')}\ %#SLInfo#%<%{expand('%:p:h')}/%#SLInfoMain#%{expand('%:t:r')}.%{expand('%:e')}\ %#SLInfo#%=%h%r%w[%n][%c:%l][%p%%/%L]
	autocmd WinLeave * setlocal statusline=%#SLOMode#\ %{ModeName()}%{IsModified()}%#SLOArrow#\ %#SLOInfo#%<%{expand('%:p:h')}/%#SLOInfoMain#%{expand('%:t:r')}.%{expand('%:e')}\ %#SLOInfo#%=%h%r%w[%n][%c:%l][%p%%/%L]
augroup END

autocmd ModeChanged * if mode() == 'i' | highlight LineNr guibg=none guifg=#800000 | else | highlight LineNr guibg=none guifg=#D00000 | endif

" //Highlights//
highlight Normal guibg=none guifg=#D00000 gui=none
highlight Comment guibg=none guifg=#900000 gui=italic
highlight Include guibg=none guifg=#D00000 gui=none
highlight Define guibg=none guifg=#D00000 gui=underline
highlight Bold guibg=none guifg=#D00000 gui=bold
highlight Constant guibg=none guifg=#FF0000 gui=bold
highlight Conditional guibg=none guifg=#D00000 gui=underline
highlight NonText guibg=none guifg=#600000 gui=none
highlight Error guifg=#D00000 guibg=#600000 gui=bold,underline
highlight Number guibg=none guifg=#FF0000 gui=bold
highlight String guibg=none guifg=#A00000 gui=none
highlight Float guibg=none guifg=#D00000 gui=underline
highlight Delimiter guibg=none guifg=#900000 gui=none
highlight Function guibg=none guifg=#FF0000 gui=bold
highlight Special guibg=none guifg=#FF0000 gui=bold
highlight Statement guibg=none guifg=#D00000 gui=none
highlight Identifier guibg=none guifg=#D00000 gui=none
highlight LineNr guibg=none guifg=#D00000
highlight LineNrAbove guibg=none guifg=#800000 gui=none
highlight LineNrBelow guibg=none guifg=#800000 gui=none
highlight Todo guibg=#D00000 guifg=#600000
highlight WildMenu guibg=none guifg=#D00000
highlight MatchParen guibg=#600000 guifg=#D00000 gui=none
highlight TabLine guibg=none guifg=#D00000 gui=bold,underline
highlight TabLineSel guibg=#D00000 guifg=#000000 gui=bold
highlight TabLineFill guibg=none guifg=#D00000 gui=bold,underline
highlight Visual guibg=#600000 guifg=#FF0000 gui=none
highlight Repeat guibg=none guifg=#D00000 gui=bold
highlight IncSearch guibg=#600000 guifg=#D00000
highlight Search guibg=#600000 guifg=#D00000
highlight CurSearch guibg=#600000 guifg=#D00000
highlight SpecialKey guibg=none guifg=#D00000 gui=none
highlight PreProc guibg=none guifg=#D00000 gui=none
highlight Operator guibg=none guifg=#800000 gui=none
highlight Type guibg=none guifg=#D00000 gui=bold
highlight Conditional guibg=none guifg=#D00000 gui=bold
highlight Title guibg=none guifg=#D00000 gui=none
highlight Boolean guibg=none guifg=#D00000 gui=bold
highlight Cursor guibg=none guifg=#D00000
highlight CursorLine guibg=#300000
highlight CursorLineFold guibg=none guifg=#600000 gui=none
highlight CursorLineNr guibg=none guifg=none gui=none
highlight CursorColumn guibg=none guifg=none gui=none
highlight Folded guibg=none guifg=#600000 gui=bold
highlight FoldColumn guibg=none guifg=#800000 gui=none
highlight SignColumn guibg=none guifg=#D00000
highlight Pmenu guibg=none guifg=#D00000
highlight PmenuSel guibg=#D00000 guifg=#000000
highlight PmenuSbar guibg=none guifg=#D00000
highlight Directory guibg=none guifg=#D00000
highlight VertSplit guibg=none guifg=#600000
highlight ErrorMsg guibg=#600000 guifg=#D00000
highlight ModeMsg guibg=none guifg=#D00000 gui=underline
highlight MoreMsg guibg=none guifg=#D00000 gui=underline
highlight DiffAdd guibg=none guifg=#00FF00 gui=none
highlight DiffChange guibg=none guifg=#FFF000 gui=none
highlight DiffDelete guibg=none guifg=#600000 gui=none
highlight DiffText guibg=#0000FF guifg=#00FFFF gui=none
highlight SpellBad guibg=#600000 guifg=#D00000 gui=underline
highlight Underlined guibg=none guifg=#D00000 gui=underline
highlight NormalFloat guibg=none
highlight @variable guibg=none guifg=#D00000 gui=none

" Use an autocmd to trigger the setup function when entering TelescopePrompt
"augroup TelescopeMappings
"  autocmd!
"  autocmd FileType TelescopePrompt call SetupTelescopeMappings()
"augroup END

" //Save/Quit//
:noremap <silent> <C-S> :w<CR>
:vnoremap <silent> <C-S> <C-C>:w<CR>
:inoremap <silent> <C-S> <C-O>:w<CR>
:noremap <silent> <C-Q> :q<CR>
:vnoremap <silent> <C-Q> <C-C>:q<CR>
:inoremap <silent> <C-Q> <C-O>:q<CR>
" :tnoremap <silent> <C-Q> <C-\><C-N>:q!<CR>
:noremap <silent> <C-S><C-A> :wa<CR>
:vnoremap <silent> <C-S><C-A> <C-C>:wa<CR>
:inoremap <silent> <C-S><C-A> <C-O>:wa<CR>
:noremap <silent> <C-Q><C-A> :qa<CR>
:vnoremap <silent> <C-Q><C-A> <C-C>:qa<CR>
:inoremap <silent> <C-Q><C-A> <C-O>:qa<CR>
:tnoremap <silent> <C-Q><C-A> <C-\><C-N>:qa<CR>
:noremap <silent> <C-Q><C-Q> :q!<CR>
:vnoremap <silent> <C-Q><C-Q> <C-C>:q!<CR>
:inoremap <silent> <C-Q><C-Q> <C-O>:q!<CR>
:noremap <silent> <C-S><C-Q> :wq<CR>
:vnoremap <silent> <C-S><C-Q> <C-C>:wq<CR>
:inoremap <silent> <C-S><C-Q> <C-O>:wq<CR>
:noremap <silent> <C-S><C-Q><C-A> :wqa<CR>
:vnoremap <silent> <C-S><C-Q><C-A> <C-C>:wqa<CR>
:inoremap <silent> <C-S><C-Q><C-A> <C-O>:wqa<CR>
:tnoremap <silent> <C-S><C-A><C-Q> <C-\><C-N>:wqa<CR>
:noremap <silent> <C-Q><C-A><C-Q> :qa!<CR>
:vnoremap <silent> <C-Q><C-A><C-Q> <C-C>:qa!<CR>
:inoremap <silent> <C-Q><C-A><C-Q> <C-O>:qa!<CR>
:tnoremap <silent> <C-Q><C-A><C-Q> <C-\><C-N>:qa!<CR>

:map <silent> <enter> A<enter><esc>
:map <silent> <S-enter> I<enter><esc>kcc<esc>
" :nnoremap <silent> <BS> i<BS><ESC>l
" :nnoremap <silent> <TAB> i<TAB><ESC>l
" :nnoremap <silent> <SPACE> i<SPACE><ESC>l
:map <space>h :noh<CR>:echo '["' . @/ . '" cleared]'<CR>
:nmap ' `
:noremap <silent> <c-/> K
:vnoremap <expr> <silent> <space>= mode() ==# "v" ? "<ESC>:set paste<CR>a<CR><ESC>`<i<CR><ESC>V:!bc<CR>gJkgJ:set nopaste<CR>" : ":!bc<CR>"
:nnoremap <silent> <space>v :source ~/.config/nvim/vimrc.vim<CR>:noh<CR>:echo "[VIM Reloaded]"<CR>
" :tnoremap <silent> <S-Space> <ESC>a<space>
nnoremap <silent> <space>b :silent !open %<CR>
let g:cwd = system('~/.scripts/./cwd.sh')

" //Normal Mode Navigation//
:noremap <silent> MM zz
:noremap <silent> J L
:noremap <silent> K H
:noremap <silent> L $
:noremap <silent> H 0
" :noremap <silent> JJ J
:noremap <silent> gK kgJ
:nnoremap <silent> <C-J> <C-F>
:nnoremap <silent> <C-K> <C-B>
:vnoremap <silent> <C-J> <C-F>
:vnoremap <silent> <C-K> <C-B>
" :inoremap <silent> <S-BS> <DEL>
:nnoremap ;j <C-O>
:nnoremap ;k <C-I>
:nnoremap <C-S-K> kzz
:nmap <C-S-J> jzz

" //Insert Mode Navigation//
:inoremap <C-h> <Left>
:inoremap <C-S-H> <Esc>bi
:inoremap <C-j> <Down>
:inoremap <C-S-J> <Esc>gja
:inoremap <C-k> <Up>
:inoremap <C-S-K> <Esc>gka
:inoremap <C-l> <Right>
:inoremap <C-S-L> <Esc>lea
:cnoremap <C-h> <Left>
:cnoremap <C-j> <Down>
:cnoremap <C-k> <Up>
:cnoremap <C-l> <Right>
" :tnoremap <C-h> <Left>
" :tnoremap <C-S-H> <Esc>bi
" :tnoremap <C-j> <Down>
" :tnoremap <C-k> <Up>
" :tnoremap <C-l> <Right>
" :tnoremap <C-S-L> <Esc>lwi

" //Copy Text//
:vnoremap <expr> <C-C> mode() ==# "v" ? '"+y:echo @+<CR>' : '<ESC>`<v`>"+y'
:nnoremap <C-C> :let @+ = @0<CR>:echo @0<CR>
:nnoremap <silent> yp :let @" = expand("%")<CR>p
:nnoremap <silent> yP :let @" = expand("%:p")<CR>p
:nnoremap <silent> yc :let @" = @:<CR>p

" //Windows//
autocmd BufLeave term://* set nonumber norelativenumber
autocmd ModeChanged * if mode() == 't' | set nonumber norelativenumber | else | set number | endif
"autocmd ModeChanged * if mode() != 't' | match ErrorMsg '\s\+$' | else | highlight clear ErrorMsg | endif
:tnoremap <C-W> <C-\><C-N><C-W>
:tnoremap <silent> <S-ESC> <C-\><C-N>
:nnoremap <silent> <C-W>v <C-W>v<C-W>w
" :map <silent> <space>W <C-W>v<C-W>s:ter<CR><C-W>h<C-W>s<space>w1<ESC>
autocmd BufWinEnter,WinEnter term://* startinsert
augroup toogle_relatie_number
	au!
	autocmd InsertEnter * :setlocal norelativenumber
	autocmd InsertLeave * :setlocal relativenumber
augroup END
" augroup TerminalInsertMode
" 	autocmd!
" 	autocmd BufEnter term://* startinsert
" augroup END

" //Tabs//
:noremap <C-T>n :tabnew \| Startify<CR>
:noremap <C-T>l gt
:noremap <C-T>h gT
:noremap <C-T>q :tabclose<CR>

" //Folds//
autocmd FileType * nnoremap <buffer> <silent> zf :set foldcolumn=1<CR>zf
autocmd FileType * vnoremap <buffer> <silent> zf :<C-u>set foldcolumn=1<CR>gvzf
:nnoremap <silent> Zo zR
:nnoremap <silent> Zc zM

" //42 header//
let g:user42 = 'dferreir'
let g:mail42 = 'dferreir@student.42.fr'

" //LazyVim//
:map <silent> <space>l :Lazy<CR>

" //LazyGit//
:nnoremap <silent> <space>g :LazyGit<CR>

" //vim-win//
:nnoremap <silent> <space>w :Win<CR>

" //Commentary//
:xmap <space>c gc
:nmap <space>c gc
:omap <space>c gc
:nmap <space>cc gcc

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

" //undo-persistence//
" guard for distributions lacking the 'persistent_undo' feature.
if has('persistent_undo')
    " define a path to store persistent undo files.
    let target_path = expand('~/.config/vim-persisted-undo/')
    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif
    " point Vim to the defined undo directory.
    let &undodir = target_path
    " finally, enable undo persistence.
    set undofile
endif
