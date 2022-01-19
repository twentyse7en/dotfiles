local lspconfig = require('lspconfig')
local api = vim.api

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }, _config or {})
end

lspconfig.html.setup(config())
lspconfig.cssls.setup(config())
lspconfig.vimls.setup(config())
lspconfig.jedi_language_server.setup(config())
lspconfig.tsserver.setup(config())
lspconfig.clangd.setup(config())
lspconfig.vuels.setup(config())
lspconfig.tailwindcss.setup(config())

local snippets_paths = function()
    local plugins = { "friendly-snippets" }
    local paths = {}
    local path
    local root_path = vim.fn.stdpath('data') .. '/plugged/'
    for _, plug in ipairs(plugins) do
        path = root_path .. plug
        if vim.fn.isdirectory(path) ~= 0 then
            table.insert(paths, path)
        end
    end
    return paths
end

require('luasnip.loaders.from_vscode').lazy_load({ paths = snippets_paths() })
