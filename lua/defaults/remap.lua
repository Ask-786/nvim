vim.g.mapleader = ' '

---@param mode string | table
---@param map string
---@param command string
---@param desc string
local map = function(mode, map, command, desc)
	vim.keymap.set(mode, map, command, { desc = desc })
end

map('n', '<leader>pv', vim.cmd.Ex, 'Ex')

map('v', 'J', ':m \'>+1<CR>gv=gv', 'Move Selected Lines Downwards')
map('v', 'K', ':m \'<-2<CR>gv=gv', 'Move Selected Lines Upwards')

map('n', '<C-d>', '<C-d>zz', 'Jump Half Page [D]ownwards')
map('n', '<C-u>', '<C-u>zz', 'Jump Half Page [U]pwards')

map('n', '<leader>vs', vim.cmd.vsplit, 'Split screen Vertically')
map('n', '<leader>hs', vim.cmd.split, 'Split screen Horizontally')

map('n', '<A-t>', vim.cmd.tabnew, 'Create new Tab')
map('n', '<A-n>', vim.cmd.tabnext, 'Jump to next Tab')
map('n', '<A-p>', vim.cmd.tabprevious, 'Jump to previous Tab')

map({ 'n', 'v' }, '<leader>y', [["+y]], '[Y]ank to System Clipboard')
map('n', '<leader>Y', [["+Y]], '[Y]ank to System Clipboard')

map('n', '<leader>tsp', '<cmd>:InspectTree<cr>', '[D]ia[G]nostics')

map('n', '[d', vim.diagnostic.goto_next, 'Next Diagnostic message')
map('n', ']d', vim.diagnostic.goto_prev, 'Previous Diagnostic message')
map('n', '<leader>e', vim.diagnostic.open_float, 'Show Diagnostics')
map('n', '<leader>dg', vim.diagnostic.setqflist, '[D]ia[G]nostics')
