" source C:\Program Files (x86)\Vim\_vimrc

syntax on

set noequalalways
set cursorline
set mouse=a
set number relativenumber
set backspace=indent,eol,start
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
set updatetime=50
set visualbell
set t_vb=
set signcolumn=yes

call plug#begin('~/vimfiles/plugged')

" Plug 'vim-scripts/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jremmen/vim-ripgrep'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'prettier/vim-prettier'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
  let g:rg_derive_root='true'
endif

let mapleader = " "

let g:netrw_browse_split = 4
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_liststyle = 3

let g:fzf_layout={ 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

nnoremap <C-p> :Files<CR>
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

inoremap <C-c> <ESC>
inoremap <C-s> <ESC>:w<CR>
nnoremap <C-s> <ESC>:w<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <C-b> :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nmap <silent>gd <Plug>(coc-definition)
nmap <Leader>rn <Plug>(coc-rename)
nnoremap <leader>u :UndotreeShow<CR>

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
