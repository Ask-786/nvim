local config = function()
	local builtin = require('telescope.builtin')
	local telescope = require('telescope')

	vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
	vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
	vim.keymap.set('n', '<leader>pa', builtin.oldfiles, {})
	vim.keymap.set('n', '<leader>pr', builtin.lsp_references, {})
	vim.keymap.set('n', '<leader>pe', builtin.diagnostics, {})
	vim.keymap.set('n', '<C-g>', builtin.git_files, {})
	vim.keymap.set('n', '<leader>ps', function()
		builtin.grep_string({ search = vim.fn.input('Grep > ') })
	end)

	telescope.setup({
		extensions = {
			['ui-select'] = {
				require('telescope.themes').get_dropdown({
					-- even more opts
				}),
			},
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = 'smart_case', -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
			},
		},
		defaults = {
			file_ignore_patterns = {
				'node_modules',
				'.git/',
			},
			mappings = {
				i = {
					['<M-j>'] = 'results_scrolling_left',
					['<M-k>'] = 'results_scrolling_right',
				},
				n = {
					['<M-j>'] = 'results_scrolling_left',
					['<M-k>'] = 'results_scrolling_right',
				},
			},
		},
		pickers = {
			find_files = {
				-- Show hidden files
				hidden = true,
			},
		},
	})

	pcall(telescope.load_extension, 'fzf')
	pcall(telescope.load_extension, 'ui-select')
end

return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	config = config,
}