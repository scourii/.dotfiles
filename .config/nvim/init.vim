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
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'andweeb/presence.nvim'
call plug#end()

let g:limelight_conceal_ctermfg = 'green'
let g:limelight_default_coefficient = 0.7
autocmd VimEnter * echo "Message"
autocmd! User GoyoEnter Limelight PencilSoft
let g:goyo_width = '140'
let NERDTreeShowHidden=1
let g:dashboard_default_executive ='telescope.nvim'
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

let g:dashboard_custom_shortcut={
\ 'last_session'       : 'SPC s l',
\ 'find_history'       : 'SPC f h',
\ 'find_file'          : 'SPC f f',
\ 'new_file'           : 'SPC c n',
\ 'change_colorscheme' : 'SPC t c',
\ 'find_word'          : 'SPC f a',
\ 'book_marks'         : 'SPC f b',
\ }
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
let g:presence_auto_update         = 1
let g:presence_neovim_image_text   = "The One True Text Editor"
let g:presence_main_image          = "neovim"
let g:presence_client_id           = "793271441293967371"
let g:presence_debounce_timeout    = 10
let g:presence_enable_line_number  = 0

" Rich Presence text options
let g:presence_editing_text        = "Editing %s"
let g:presence_file_explorer_text  = "Browsing %s"
let g:presence_git_commit_text     = "Committing changes"
let g:presence_plugin_manager_text = "Managing plugins"
let g:presence_reading_text        = "Reading %s"
let g:presence_workspace_text      = "Working on %s"
let g:presence_line_number_text    = "Line %s out of %s"
let g:templates_directory = '~/.config/nvim/templates'

nnoremap <C-n> :NERDTreeToggle<CR>
noremap <C-g> :Goyo<CR> 
noremap <C-l> :Limelight!!<CR>
nnoremap <C-p> :PencilSoft<CR>
nnoremap <C-f> :Telescope find_files<CR>
set runtimepath^=~/.vim runtimepath+=~/.vim/after


let &packpath = &runtimepath
source ~/.vimrc
