-- smooth function can be customized
-- key mapping are in init.vim

require('neoscroll').setup({
    easing_function = "quadratic" -- Default easing function
    -- Set any other options as needed
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
-- Use the "sine" easing function
t['<S-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '350', [['sine']]}}
t['<S-n>'] = {'scroll', { 'vim.wo.scroll', 'true', '350', [['sine']]}}
-- When no easing function is provided the default easing function (in this case "quadratic") will be used
t['zt']    = {'zt', {'300'}}
t['zz']    = {'zz', {'300'}}
t['zb']    = {'zb', {'300'}}

require('neoscroll.config').set_mappings(t)
