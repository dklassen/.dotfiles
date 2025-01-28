return {
	'junegunn/fzf',
	{
		'joshdick/onedark.vim',
		lazy = true,
	},
	{
		'folke/tokyonight.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	'junegunn/fzf.vim',
	{
		'preservim/nerdtree',
                cmd = { "NERDTreeToggle", "NERDTreeFocus", "NERDTreeFind", "NERDTree" }, -- Lazy load commands
		keys = { -- Key mappings for NERDTree
		    { "<leader>n", ":NERDTreeFocus<CR>", desc = "Focus NERDTree" },
		    { "<C-n>", ":NERDTree<CR>", desc = "Open NERDTree" },
		    { "<C-t>", ":NERDTreeToggle<CR>", desc = "Toggle NERDTree" },
		    { "<C-f>", ":NERDTreeFind<CR>", desc = "Find current file in NERDTree" },
		},
	},
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'junegunn/vim-easy-align',
	'tell-k/vim-autopep8',
	'MunifTanjim/nui.nvim',
	{
		'mrcjkb/rustaceanvim',
		version = '^5', -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	'nvim-lua/plenary.nvim',
	'nvim-telescope/telescope.nvim',
	'git@github.com:github/copilot.vim',
	{
		'rest-nvim/rest.nvim',
		requires = { "nvim-lua/plenary.nvim" },
		ft = 'http',
		config = function()
			require("rest-nvim").setup({
				--- Get the same options from Packer setup
				-- Open request results in a horizontal split
				result_split_horizontal = false,
				-- Keep the http file buffer above|left when split horizontal|vertical
				result_split_in_place = false,
				-- stay in current windows (.http file) or change to results window (default)
				stay_in_current_window_after_split = false,
				-- Skip SSL verification, useful for unknown certificates
				skip_ssl_verification = false,
				-- Encode URL before making request
				encode_url = true,
				-- Highlight request on run
				highlight = {
					enabled = true,
					timeout = 150,
				},
				result = {
					-- toggle showing URL, HTTP info, headers at top the of result window
					show_url = true,
					-- show the generated curl command in case you want to launch
					-- the same request via the terminal (can be verbose)
					show_curl_command = false,
					show_http_info = true,
					show_headers = true,
					-- table of curl `--write-out` variables or false if disabled
					-- for more granular control see Statistics Spec
					show_statistics = false,
					-- executables or functions for formatting response body [optional]
					-- set them to false if you want to disable them
					formatters = {
						json = "jq",
						html = function(body)
							return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
						end
					},
				},
				-- Jump to request line on run
				jump_to_request = false,
				env_file = '.env',
				-- for telescope select
				env_pattern = "\\.env$",
				env_edit_command = "tabedit",
				custom_dynamic_variables = {},
				yank_dry_run = true,
				search_back = true,
			})
		end
	},
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			{ 'windwp/nvim-ts-autotag', opts = {} },
		},
		build = ':TSUpdate',
		event = 'BufReadPost',
	}

}
