require('telescope').setup {
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      width = 0.5,
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    path_display = {
      truncate = 3,
    }
  },
}

vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files find_command=rg,--ignore,--sortr,modified,--files<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':Telescope find_files find_command=rg,--no-ignore,-g,!.git/,--hidden,--sortr,modified,--files<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope live_grep<CR>', { silent = true, noremap = true })
