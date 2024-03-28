call plug#begin()
Plug 'navarasu/onedark.nvim'
Plug 'ayu-theme/ayu-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'drewtempelmeyer/palenight.vim'
Plug 'preservim/nerdtree'
Plug 'wojciechkepka/vim-github-dark'
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'jceb/vim-orgmode'
call plug#end()

let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'gitbranch#name'
    \ },
    \ }

if (has("termguicolors"))
  set termguicolors
endif

colorscheme onedark

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set noshowmode
set hidden
set number
set relativenumber
set inccommand=split
set splitright

"Bindings
let mapleader="\<space>"
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>nv :vsplit <cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>l <c-w>l
nnoremap <leader>m <c-w>h

nnoremap <c-p> :Files<cr>
nnoremap <c-P> :Rg<cr>
nnoremap <leader>y "*y
nnoremap <leader>/ :noh<return><esc>

nnoremap <leader>140 :vertical resize 140<return><esc>
nnoremap <leader>120 :vertical resize 120<return><esc>
nnoremap <leader>100 :vertical resize 100<return><esc>

nnoremap <leader>pc :make<return><esc>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
map <C-b> :NERDTreeToggle<CR>
