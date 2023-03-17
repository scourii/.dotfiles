set termguicolors
call plug#begin('~/.vim/plugged') " roughly ordered by importance

" VISUAL CHANGES
" ##############
" Very useful
Plug 'itchyny/lightline.vim' " lightline
Plug 'sheerun/vim-polyglot' " syntax highlighting lang pack
Plug 'unblevable/quick-scope' " hilight 2-keystroke ftFT destinations
Plug 'psliwka/vim-smoothie' " smooth scrolling for jump commands
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'dhruvasagar/vim-table-mode'
" Less necessary
Plug 'mengelbrecht/lightline-bufferline' " add bufferline through lightline
Plug 'romainl/vim-cool' " turns off highlighting when done searching
Plug 'gko/vim-coloresque' " color codes are hilighted with the appropriate color
Plug 'Yggdroot/indentLine' " indentation line and leading spaces

" FUNCTIONALITY CHANGES
" #####################
" Quite useful for coding
Plug 'KabbAmine/vCoolor.vim' " color picker
Plug 'andymass/vim-matchup' " extends % to syntax, hl {} TODO: learn more about
Plug 'easymotion/vim-easymotion' " label-style jumps
Plug 'justinmk/vim-sneak'
Plug 'jiangmiao/auto-pairs' " autoindent and closing brace on {<CR>
Plug 'xolox/vim-session' " Session manager / automatically open buffers
  Plug 'xolox/vim-misc' " Dependency for vim-session
Plug 'tpope/vim-surround' " matching tags text object
Plug 'tpope/vim-repeat' " . repeats plugin operations
" Seemingly less necessary... for now
Plug 'preservim/nerdtree' " file explorer
Plug 'preservim/nerdcommenter' " comment/uncomment binds
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " TODO: learn features
Plug 'junegunn/fzf.vim' " TODO: learn features
Plug 'michaeljsmith/vim-indent-object' " text object based on indentation
Plug 'machakann/vim-highlightedyank' " briefly hilight yank
Plug 'honza/vim-snippets' " snippets for all languages

call plug#end()
autocmd FileType markdown setlocal spell
" ################
" ### MAPPINGS ###
" ################
let mapleader = ","

" NEW FUNCTIONALITY / HIGH IMPORTANCE QOL
" #######################################

set clipboard=unnamedplus
vnoremap r "_dP | " replace selection with yank register
nnoremap <Space> za | " toggle folds with space
nnoremap <expr> <leader><space> &foldlevel ? 'zM' :'zR' | " toggle ALL folds
tnoremap <Esc> <C-\><C-n> | " exit terminal mode with esc

" BUFFER MANAGEMENT
nnoremap ,, ,
nnoremap <leader>o :Files<cr>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader><Tab> :Buffers<CR>
nnoremap <silent><Leader><C-q> :bd!<Cr>
nnoremap <silent><C-q> :bn<bar>:bd!#<CR>
nnoremap <silent>,h :bp<CR>
nnoremap <silent>,. :bn<CR>
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" Copy to system clipboard (aka + register)
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
" Paste from system clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" MINOR TWEAKS
" ############
nnoremap / /\v | " Search with "very magic" regexs
vnoremap / /\v

nnoremap <CR> o<Esc>
nnoremap ZZ :wqall<CR>
nnoremap <silent> <C-s> :update<CR> 
vnoremap <silent> <C-s> <C-C>:update<CR>
inoremap <silent> <C-s> <C-O>:update<CR><Esc>
nnoremap <silent> <C-p> :update<CR> 
vnoremap <silent> <C-p> <C-C>:update<CR>
inoremap <silent> <C-p> <C-O>:update<CR><Esc>
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
" Refresh when plugins fuck up.
noremap <F12> <Esc>:syn off <bar> syn on <bar> highlight clear SignColumn <bar> bp <bar> bn<CR>
vnoremap c <esc>v

" PLUGIN MAPPINGS
" ###############
" 2-character Sneak (default)
"nmap <Del> <Plug>Sneak_s
"nmap <BS> <Plug>Sneak_S
"" visual-mode
"xmap <Del> <Plug>Sneak_s
"xmap <BS> <Plug>Sneak_S
"" operator-pending-mode
"omap <Del> <Plug>Sneak_s
"omap <BS> <Plug>Sneak_S

nnoremap s s
nnoremap S S
xnoremap s s
onoremap s s
onoremap S S

map <C-n> :NERDTreeToggle<CR>

" EasyMotion mappings
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_keys = 'arstgmneioqwfpbjluyzxcdvkh'
map <Leader> <Plug>(easymotion-prefix)
nmap <Del> <Plug>(easymotion-f)
nmap <BS> <Plug>(easymotion-F)
vmap <Del> <Plug>(easymotion-f)
vmap <BS> <Plug>(easymotion-F)
nmap <leader>w <Plug>(easymotion-w)
nmap <leader>W <Plug>(easymotion-W)
nmap <leader>b <Plug>(easymotion-b)
nmap <leader>B <Plug>(easymotion-B)
nmap <leader>e <Plug>(easymotion-e)
nmap <leader>E <Plug>(easymotion-E)
nmap <leader>ge <Plug>(easymotion-ge)
nmap <leader>gE <Plug>(easymotion-gE)
nmap <leader>n <Plug>(easymotion-n)
nmap <leader>N <Plug>(easymotion-N)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap <leader>/ /
omap <leader>/ /
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)


" ####################
" ### VIM SETTINGS ###
" ####################

" Fold fix - must be at top
filetype plugin indent on
set foldenable
set foldmethod=marker
au FileType sh let g:sh_fold_enabled=5
au FileType sh let g:is_bash=0
au FileType sh set foldmethod=syntax
syntax enable

" check for and load file changes
autocmd WinEnter,BufWinEnter,FocusGained * checktime

" disable swapfile to avoid errors on load
set noswapfile

" VISUAL
set number " line numbers
set cursorline " Show current line
set relativenumber " Line numbers as an offset from cursor position
set termguicolors " 24 bit colors (Essential for color code preview)
" Enable true color 启
if (has("termguicolors"))
  set termguicolors
endif
set list " show whitespace characters as defined by listchars
set listchars=tab:ŝ·,trail:~,extends:»,precedes:«,nbsp:⣿
set ruler " cursor coordinates
set wrap " no horizontal scrolling
set linebreak " break lines in viewport at allowed characters only
set breakindent " indent lines wrapped in the view
set scrolloff=3 " minimum 3 lines below and above cursor
set laststatus=2 " always show status bar (in my case lightline)
set noshowmode " disable -- INSERT -- since lightline has it
set showcmd " show selection size and last command

" FUNCTIONAL
set hidden " Allow hidden buffers
set backspace=indent,eol,start " <BS> deletes newline etc
set autowrite " Auto save changes before switching buffer
set matchpairs+=<:> " use % to jump between pairs, this adds <>
set whichwrap+=<,>,h,l,[,] " when at end/beginning of line, left/j/etc wraps

set incsearch " highlights all current search matches
set hlsearch " ?? TODO: figure out exactly how this and vim-cool interact
set ignorecase
set smartcase " Don't ignore case if you input caps

set foldmethod=syntax
set foldnestmax=1
set nofoldenable
set foldlevel=1

set mouse=a " Mouse support in all modes
set textwidth=80 " used by autoformatter
set formatoptions=qn1
set tabstop=8 " length of real tabs
set shiftwidth=8 " autoindent step size
set noexpandtab " when pressing tabs insert spaces instead
set softtabstop=4 " number of spaces that is inserted when pressing tab
set shiftround " autoindent must be rounded to shiftwidth
set pastetoggle=<F2>
set wildcharm=<C-z>
set wildmenu " tab completion
set wildmode=longest,list,full
set shortmess=a

syntax on " syntax highlighting
filetype plugin on " filetype detection

augroup CursorLine " hide cursorline on non-focused windows
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" STUFF
set modelines=0 "security
set encoding=utf-8


" ########################
" ### PLUGIN SETTINGS ###
" #######################


" EASY ESCAPE
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100
cnoremap jk <ESC>
cnoremap kj <ESC>
let g:smoothie_base_speed = 15 " scrolling animationspeed

" VIM-SESSION: Autosave/load session
let g:session_autosave = 'yes'
let g:session_autoload = 'no'
let g:session_verbose_messages = 0
set sessionoptions-=buffers

" QUICKSCOPE: highlight good ft destinations
" Set style
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#C52C9A' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#64938C' gui=underline ctermfg=81 cterm=underline
augroup END
" Disable quickscope in terminal windows
let g:qs_buftype_blacklist = ['terminal']

" MATCHUP: expand % to keywords
let g:matchup_matchparen_deferred = 1 " performance improvement
let g:matchup_matchparen_hi_surround_always = 1 " always highlights surrounding {}
" LIGHTLINE: Statusbar
set background=light
let g:lightline = {
      \ 'colorscheme': 'noelle',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename' ],
      \             [ 'CurrentFunction' ] ],
      \  'right': [ [ 'lineinfo' ],
      \             [ 'percent' ],
      \             [ 'statuslinetabs' ] ],
      \ },
      \ 'inactive': {
      \ 'left': [ [ 'filename' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ] ],
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'statuslinetabs': 'LightlineStatuslineTabs',
      \ }
      \ }

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction
function! LightlineStatuslineTabs() abort
  return join(map(range(1, tabpagenr('$')),
        \ '(v:val == tabpagenr() ? " •" : " ·") . lightline#tab#tabnum(v:val)  . (v:val == tabpagenr() ? "" : "")'), "")
endfunction

function! LightlineStatuslineTabs() abort
    return join(map(range(1, tabpagenr('$')),
            \ '(v:val == tabpagenr() ? " •" : " ·") . lightline#tab#tabnum(v:val)  . (v:val == tabpagenr() ? "" : "")'), "")
  endfunction

function! CocCurrentFunction() abort
  let cur = get(b:, 'coc_current_function', '')
  if (cur!="")
    return "›" . get(b:, 'coc_current_function', '')
  else
    return ""
  endif
endfunction
let g:lightline.tabline          = {'left': [['buffers']], 'right': [] }
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
set showtabline=2 " show tabline always
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#number_separator = "."
let g:lightline.component_raw = {'buffers': 1}
let g:lightline#bufferline#clickable = 1
let g:lightline#bufferline#filename_modifier = ':t:r:s?^\.??'
let g:lightline#bufferline#more_buffers = "»"
" function! CocCurrentFunction()
"   return get(b:, 'coc_current_function', '')
"" endfunction


" INDENTLINE (show leading spaces)
let g:indentLine_leadingSpaceChar = '·'
"let g:indentLine_leadingSpaceChar = '•'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_char = '·'
"let g:indentLine_char = '•'
autocmd VimEnter * LeadingSpaceEnable
autocmd BufRead,BufEnter,BufNewFile * LeadingSpaceEnable

let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
" italics support
set t_ZH=^[[3m
set t_ZR=^[[23
highlight HighlightedyankRegion guibg=#FFD297
highlight Visual guibg=#FFE497 gui=none
colorscheme noelle
