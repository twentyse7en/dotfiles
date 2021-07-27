local lspconfig = require('lspconfig')
local api = vim.api

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    --Enable completion triggered by <c-x><c-o>
    api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    api.nvim_buf_set_keymap(0, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    api.nvim_buf_set_keymap(0, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    api.nvim_buf_set_keymap(0, 'n', 'gK', '<Cmd>Lspsaga hover_doc<CR>', opts)
    api.nvim_buf_set_keymap(0, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    api.nvim_buf_set_keymap(0, 'n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    api.nvim_buf_set_keymap(0, 'n', 'grn', '<cmd>Lspsaga rename<CR>', opts)
    api.nvim_buf_set_keymap(0, 'n', 'gca', '<cmd>Lspsaga code_action<CR>', opts)
    api.nvim_buf_set_keymap(0, 'n', 'grr', '<cmd>Telescope lsp_references<CR>', opts)
    api.nvim_buf_set_keymap(0, 'n', '<leader>sl', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
    api.nvim_buf_set_keymap(0, 'n', '<leader>dn', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
    api.nvim_buf_set_keymap(0, 'n', '<leader>dp', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)

end

lspconfig.html.setup { on_attach = on_attach }
lspconfig.cssls.setup { on_attach = on_attach }
lspconfig.pylsp.setup { on_attach =  on_attach }
