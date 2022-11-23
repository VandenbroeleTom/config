require('telescope').setup {
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = true
    }
  }
}

require('telescope').load_extension('fzf')
