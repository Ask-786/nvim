local config = function()
	require('gitsigns').setup({
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			map('n', '<leader>g[', function()
				if vim.wo.diff then
					return '<leader>g['
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return '<Ignore>'
			end, { expr = true })

			map('n', '<leader>g]', function()
				if vim.wo.diff then
					return '<leader>g]'
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return '<Ignore>'
			end, { expr = true })

			map('n', '<leader>gS', gs.stage_hunk)
			map('n', '<leader>gu', gs.reset_hunk)
			map('v', '<leader>gS', function()
				gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
			end)
			map('v', '<leader>gu', function()
				gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
			end)
			map('n', '<leader>gU', gs.undo_stage_hunk)
			map('n', '<leader>gR', gs.reset_buffer)
			map('n', '<leader>gk', gs.preview_hunk)
			map('n', '<leader>gb', function()
				gs.blame_line({ full = true })
			end)
			map('n', '<leader>gd', gs.diffthis)
			map('n', '<leader>gD', function()
				gs.diffthis('~')
			end)
			map('n', '<leader>td', gs.toggle_deleted)
		end,

		signs = {
			add = { text = '│' },
			change = { text = '│' },
			delete = { text = '_' },
			topdelete = { text = '‾' },
			changedelete = { text = '~' },
			untracked = { text = '┆' },
		},
		signcolumn = true,
		numhl = false,
		linehl = false,
		word_diff = false,
		watch_gitdir = {
			follow_files = true,
		},
		attach_to_untracked = true,
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = 'eol',
			delay = 1000,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil,
		max_file_length = 40000,
		preview_config = {
			border = 'rounded',
			style = 'minimal',
			relative = 'cursor',
			row = 0,
			col = 1,
		},
		yadm = {
			enable = false,
		},
	})
end

return {
	'lewis6991/gitsigns.nvim',
	config = config,
}