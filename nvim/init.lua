vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.backspace = [[indent,eol,start]]
vim.opt.scrolloff = 10
vim.opt.mouse = a
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.noerrorbells = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- vim.opt.noswapfile = true
-- vim.opt.nobackup = true
-- vim.opt.nowritebackup = true
-- vim.opt.nohlsearch = true
vim.opt.undodir = '~/.vim/undodir'
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.updatetime = 50
vim.opt.visualbell = true
-- vim.opt.t_vb = ''
-- vim.opt.signcolumn = true
vim.opt.iskeyword = '@,48-57,_,192-255,$'

vim.cmd('colorscheme gruvbox')

vim.g.mapleader = [[ ]]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<C-c>:w<CR>', { silent = true, noremap = true })

vim.api.nvim_set_keymap('n', '<leader>h', ':wincmd h<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>j', ':wincmd j<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', ':wincmd k<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':wincmd l<CR>', { silent = true, noremap = true })

vim.api.nvim_set_keymap('n', '<M-&>', ':NvimTreeToggle<CR>', { silent = true, noremap = true })

require('plugins')
require('lsp_config')
require('telescope_config')
require('nvim_tree_config')
