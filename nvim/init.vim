syntax on

set splitright
set splitbelow
set backspace=indent,eol,start
set scrolloff=10
set mouse=a
set number relativenumber
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set ignorecase
set smartcase
set noswapfile
set nobackup
set nowritebackup
set nohlsearch
set undodir=~/.vim/undodir
set undofile
set incsearch
set updatetime=50
set visualbell
set t_vb=
set signcolumn=yes
set iskeyword=@,48-57,_,192-255,$

call plug#begin('~/.vim/plugged')

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'APZelos/blamer.nvim'
Plug 'airblade/vim-rooter'
Plug 'dart-lang/dart-vim-plugin'
Plug 'editorconfig/editorconfig-vim'
Plug 'github/copilot.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'morhetz/gruvbox'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
Plug 'tpope/vim-commentary'
" Plug 'vim-airline/vim-airline'
call plug#end()

let g:rooter_patterns = ['.git']

colorscheme gruvbox
set background=dark

let mapleader = " "
let g:rooter_manual_only = 1

nnoremap <C-s> :w<CR>
inoremap <C-s> <C-c>:w<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <M-&> :NvimTreeToggle<CR>


autocmd FileType scss setl iskeyword+=@-@
autocmd FileType twig setl filetype=html
autocmd FileType php let b:AutoPairs = AutoPairsDefine({'<?': ''})
autocmd BufNewFile,BufRead *.blade.php set filetype=blade
autocmd BufNewFile,BufRead *.module set filetype=php
autocmd BufNewFile,BufRead *.install set filetype=php

lua require('lsp_config')
lua require('telescope_config')
lua require('nvim_tree_config')

""" Telescope
nnoremap <C-p> :Telescope git_files<CR>
nnoremap <C-n> :Telescope find_files<CR>
nnoremap <C-f> :lua require("telescope.builtin").live_grep()<CR>

" NVIMTree
let g:nvim_tree_quit_on_open = 1

" Blamer
let g:blamer_enabled = 1
