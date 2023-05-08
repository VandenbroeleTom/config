local lspconfig = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

end

-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  'intelephense',
  'cssls', -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls
  'html', -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html
  'jsonls', -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls
  'emmet_ls', -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#emmet_ls
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

require('cmp').setup({

  snippet = {
    expand = function (args)
      vim.fn['vsnip#anonymous'](args.body)
    end
  },

  mapping = require('cmp').mapping.preset.insert({
    ['<C-Space>'] = require('cmp').mapping.complete(),
    ['<CR>'] = require('cmp').mapping.confirm({ select = false }),
  }),

  sources = require('cmp').config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }),

  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
})
