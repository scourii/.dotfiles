set nocompatible
filetype on
set mouse=a
set number
set textwidth=100
filetype indent on
filetype plugin on
filetype plugin indent on
set termguicolors
set clipboard+=unnamedplus

call plug#begin('~/.config/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'junegunn/limelight.vim'
call plug#end()

let g:limelight_conceal_ctermfg = 'green'
let g:limelight_default_coefficient = 0.7


let g:nvim_tree_side = "left"
let g:nvim_tree_width = 24
let g:nvim_tree_auto_open = 0
let g:nvim_tree_auto_close = 0
let g:nvim_tree_quit_on_open = 0
let g:nvim_tree_follow = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_hide_dotfiles = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_root_folder_modifier = ":~"
let g:nvim_tree_tab_open = 1
let g:nvim_tree_allow_resize = 1

let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 0,
    \ 'files': 0,
    \ }
let g:nvim_tree_auto_open = 1

autocmd! User GoyoEnter Limelight PencilSoft
let g:goyo_width = '140'
let NERDTreeShowHidden=1

autocmd BufNewFile,BufRead *.mdown set filetype=pandoc
autocmd BufNewFile *.mdown r ~/.config/nvim/templates/template.mdown | set expandtab
autocmd BufNewFile *.mkdwn r ~/.config/nvim/templates/template.mkdwn

set rulerformat=%25(%)
set rulerformat+=%=
"set rulerformat+=%{&modified?'*':''}
set rulerformat+=\ %v:%l\ ~\ %p%%
set rulerformat+=\ \|\ %Y%*

set statusline=
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=\ %{&modified?'[+]':''}
set statusline+=%=
set statusline+=\ %v:%l\/%L
set statusline+=\ %Y%4*

let g:currentmode = {
            \ 'n'  : 'normal',
            \ 'no' : 'n-op',
            \ 'v'  : 'visual',
            \ 'V'  : 'line',
            \ '' : 'block',
            \ 's'  : 'selection',
            \ 'S'  : 'line select',
            \ '' : 'block select',
            \ 'i'  : 'insert',
            \ 'R'  : 'replace',
            \ 'Rv' : 'visual replace',
            \ 'c'  : 'command',
            \ 'cv' : 'vim execute',
            \ 'ce' : 'execute',
            \ 'r'  : 'prompt',
            \ 'rm' : 'more',
            \ 'r?' : 'confirm',
            \ '!'  : 'shell',
            \ 't'  : 'terminal'
                   \}

hi StatusLine    ctermfg=black ctermbg=red
hi StatusLineNC  ctermfg=red   ctermbg=8

let g:templates_directory = '~/.config/nvim/templates'
nnoremap <C-n> :NERDTreeToggle<CR>
noremap <C-g> :Goyo<CR> 
noremap <C-l> :Limelight!!<CR>
nnoremap <C-p> :PencilSoft<CR>
set runtimepath^=~/.vim runtimepath+=~/.vim/after


let &packpath = &runtimepath
source ~/.vimrc
