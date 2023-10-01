syntax on
filetype plugin indent on

set hlsearch
set scrolloff=7
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set laststatus=2
"set statusline+=%{FugitiveStatusline()}
set foldlevelstart=20
set conceallevel=1
let g:indentLine_conceallevel=1
"let g:indentLine_setConceal = 1
"let g:indentLine_color_term = 239
"let g:indentLine_char = 'c'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"let g:ale_sign_error = '✘'
"let g:ale_sign_warning = '⚠'
"let g:ale_lint_on_text_changed = 'never'

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = 'gopls'
let g:go_fmt_command='goimports'
let g:go_list_type='quickfix'
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_rename_command='gopls'


call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'srcery-colors/srcery-vim'
Plug 'itchyny/lightline.vim'
Plug 'leafgarland/typescript-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'preservim/nerdtree'
Plug 'hashivim/vim-terraform'
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'tribela/vim-transparent'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ervandew/supertab'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'Alexis12119/nightly.nvim'
call plug#end()

set t_Co=256

set termguicolors
"colorscheme srcery
colorscheme ayu
let ayucolor="dark"

"colorscheme ayu
let maplocalleader = "m"
let mapleader = " "

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
                  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-@> coc#refresh()

nnoremap <leader>k <C-w>k
nnoremap <leader>j <C-w>j
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h
nnoremap <leader>jn <C-w>h <C-w>j
nnoremap <leader>ko <C-w>k <C-w>l
inoremap <esc> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Right> <nop>
inoremap <Left> <nop>
inoremap jk <esc>
vnoremap jk <esc>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>F :Files<CR>
nnoremap <leader>G :GFiles<CR>
inoremap <C-u> <esc>VUi
nnoremap <c-u> VU

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <leader>q :qa!<CR>
nnoremap <leader>vs :vsplit<cr>
nnoremap <leader>hs :split<cr>
" Close vsplit
nnoremap <leader>cs <c-w>c
nnoremap <localleader>j 20j
nnoremap <localleader>k 20k
vnoremap <localleader>j 20j
vnoremap <localleader>k 20k
vnoremap <localleader>v :norm i#
vnoremap <localleader>V "+y

autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType golang nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType golang vnoremap <buffer> <localleader>c I//<esc>
autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
autocmd FileType ruby nnoremap <buffer> <localleader>c I#<esc>
autocmd FileType yaml nnoremap <buffer> <localleader>c I#<esc>
autocmd FileType yaml vnoremap <buffer> <localleader>c I#<esc>
autocmd FileType javascript :iabbrev <buffer> if if()<left>

" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree

" Start NERDTree. If a file is specified, move the cursor to its window.
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:> foldmethod=indent nofoldenable
