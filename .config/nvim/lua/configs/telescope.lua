local action_state = require('telescope.actions.state')
local action = require('telescope.actions')

require('telescope').setup{
	defaults = {
		prompt_prefix = "~ ",
		mappings = {
			-- in insert mode
			i = {
				["<c-a>"] = function()
					selected = action_state.get_selected_entry()
					vim.api.nvim_set_current_dir(selected[1])
				end,
				["<Leader>v"] = action.select_vertical,
			},
			n = {
				["<Leader>v"] = action.select_vertical,
			}
		}
	}
}

require('telescope').load_extension('fzf')


-- Keymapping funcitions
local mappings = {

}

local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

mappings.curr_buff = function()
	local opt = themes.get_ivy()
	builtin.current_buffer_fuzzy_find(opt)
end

mappings.search_dotfiles = function()
	builtin.find_files({
		promp_title = "< VimRc >",
		cwd = "~/.config/nvim/",
	})
end

return mappings
