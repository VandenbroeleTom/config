syntax on

set noequalalways
set title
set splitbelow
set splitright
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
set undodir=~/vimfiles/undodir
set undofile
set incsearch
set updatetime=50
set visualbell
set t_vb=
set signcolumn=yes
set shell=cmd
set hidden
set wildignore

call plug#begin('~/vimfiles/plugged')

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

nnoremap <leader>o o<ESC>k
nnoremap <leader>O O<ESC>j
nnoremap <C-p> :GFiles --cached --others<CR>
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

" Visual mode
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" COC
nmap <silent>gd <Plug>(coc-definition)
nmap <Leader>rn <Plug>(coc-rename)
nnoremap <silent> K :call <SID>show_documentation()<CR>
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()
inoremap <silent><expr> <C-space> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

nnoremap <leader>u :UndotreeShow<CR>

