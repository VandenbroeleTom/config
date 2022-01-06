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

" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" Plug 'neovim/nvim-lspconfig'
Plug 'airblade/vim-rooter'
Plug 'editorconfig/editorconfig-vim'
Plug 'github/copilot.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'kyazdani42/nvim-tree.lua'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'APZelos/blamer.nvim'
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'

call plug#end()

let g:rooter_patterns = ['.git']

colorscheme gruvbox
set background=dark

let mapleader = " "
let g:rooter_manual_only = 1

" let g:coq_settings = { 'auto_start': v:true, 'keymap': { 'pre_select': v:true } }

nnoremap <C-s> :w<CR>
inoremap <C-s> <C-c>:w<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <M-&> :NvimTreeToggle<CR>

let g:coc_global_extensions = [
  \'coc-css',
  \'coc-git',
  \'coc-go',
  \'coc-highlight',
  \'coc-html',
  \'coc-git',
  \'coc-css',
  \'coc-prettier',
  \'coc-emmet',
  \'coc-json',
  \'coc-markdownlint',
  \'coc-phpactor',
  \'coc-prettier',
  \'coc-python',
  \'coc-vetur',
  \'coc-yaml',
  \]

autocmd FileType scss setl iskeyword+=@-@
autocmd FileType twig setl filetype=html
autocmd FileType php let b:AutoPairs = AutoPairsDefine({'<?': ''})
autocmd BufNewFile,BufRead *.blade.php set filetype=blade

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
nmap <leader>rn <Plug>(coc-rename)

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

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" lua require('lsp_config')
lua << EOF

require('telescope').setup {
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = true
    }
  }
}

require('telescope').load_extension('fzf')
EOF

""" Telescope
nnoremap <C-p> :Telescope git_files<CR>
nnoremap <C-n> :Telescope find_files<CR>
nnoremap <C-f> :lua require("telescope.builtin").live_grep()<CR>

" NVIMTree
let g:nvim_tree_quit_on_open = 1
lua << EOF
require('nvim-tree').setup({
  update_focused_file = {
    enable = true
  }
})
EOF

" Blamer
let g:blamer_enabled = 1
