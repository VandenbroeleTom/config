syntax on

set backspace=indent,eol,start
set mouse=a
set number relativenumber
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smartcase
set noswapfile
set nobackup
set nohlsearch
" set undodir=~/vimfiles/undodir
set undodir=~/.vim/undodir
set undofile
set incsearch
set updatetime=50
set visualbell
set t_vb=
set signcolumn=yes
set iskeyword=@,48-57,_,192-255,$

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-rooter'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

colorscheme gruvbox
set background=dark

let mapleader = " "

let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:coq_settings = { 'auto_start': v:true, 'keymap': { 'pre_select': v:true } }

nnoremap <C-s> :w<CR>
inoremap <C-s> <C-c>:w<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

""" Telescope
nnoremap <C-p> :Telescope git_files<CR>
nnoremap <C-n> :Telescope find_files<CR>

lua require('lsp_config')
