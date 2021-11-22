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

Plug 'airblade/vim-rooter'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'editorconfig/editorconfig-vim'
" Plug 'neovim/nvim-lspconfig'
" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'

call plug#end()

colorscheme gruvbox
set background=dark

let mapleader = " "

let g:netrw_banner = 0
let g:netrw_winsize = 25
" let g:coq_settings = { 'auto_start': v:true, 'keymap': { 'pre_select': v:true } }

nnoremap <C-s> :w<CR>
inoremap <C-s> <C-c>:w<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <M-&> :NvimTreeToggle<CR>

let g:coc_global_extensions = [
  \'@yaegassy/coc-intelephense',
  \'coc-markdownlint',
  \'coc-highlight',
  \'coc-vetur',
  \'coc-go',
  \'coc-python',
  \'coc-json',
  \'coc-html',
  \'coc-git',
  \'coc-css',
  \'coc-yaml',
  \'coc-prettier',
  \]

autocmd FileType scss setl iskeyword+=@-@

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" lua require('lsp_config')
lua require('telescope_config')

""" Telescope
nnoremap <C-p> :Telescope git_files<CR>
nnoremap <C-n> :Telescope find_files<CR>

lua << EOF
require('nvim-tree').setup()
EOF
