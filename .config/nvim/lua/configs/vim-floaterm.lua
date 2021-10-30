vim.g.floaterm_keymap_toggle = '<Leader>ft'
vim.g.floaterm_keymap_new = '<Leader>fc'
vim.g.floaterm_keymap_next = '<Leader>fn'
vim.g.floaterm_keymap_prev = '<Leader>fp'

vim.api.nvim_set_keymap('n', '<Space>fl', '<cmd>FloatermNew lazygit<CR>', { noremap = true })

local map = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, "<cmd> " .. result .. "<CR>", {
    noremap = true, silent = true
  })
end
