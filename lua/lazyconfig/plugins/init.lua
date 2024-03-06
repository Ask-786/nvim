return {
	{ 'nvim-lua/plenary.nvim' },
	{ 'nvim-tree/nvim-web-devicons' },
	{
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup({})
		end,
	},
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end,
	},

	-- LSP Tools
	{ 'nvimtools/none-ls.nvim' },
	{ 'neovim/nvim-lspconfig' }, -- Required
	{ 'williamboman/mason.nvim' }, -- Optional
	{ 'williamboman/mason-lspconfig.nvim' }, -- Optional
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
	},

	-- Telescope Extensions
	{
		'nvim-telescope/telescope-ui-select.nvim',
		dependencies = 'nvim-telescope/telescope.nvim',
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
		dependencies = 'nvim-telescope/telescope.nvim',
	},

	-- CMP Plugins
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'saadparwaiz1/cmp_luasnip', dependencies = 'L3MON4D3/LuaSnip' },
}