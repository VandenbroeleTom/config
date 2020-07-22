source C:\Program Files (x86)\Vim\_vimrc

syntax on

set relativenumber
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smartcase
set noswapfile
set nobackup
set undodir=~/vimfiles/undodir
set undofile
set incsearch
set cmdheight=2
set updatetime=50

call plug#begin('~/vimfiles/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jremmen/vim-ripgrep'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'

call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
  let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
