require('telescope').setup {
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = true
    }
  }
}

vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope git_files<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':Telescope find_files<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':lua require("telescope.builtin").live_grep()<CR>', { silent = true, noremap = true })
