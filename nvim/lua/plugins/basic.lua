return {
	'godlygeek/tabular',
	'junegunn/fzf',
	{
		'joshdick/onedark.vim',
		lazy = true,
	},
        {  "ray-x/go.nvim",
           dependencies = {  -- optional packages
	    "ray-x/guihua.lua",
	    "neovim/nvim-lspconfig",
	    "nvim-treesitter/nvim-treesitter",
	  },
	  config = function()
	    require("go").setup()
	  end,
	  event = {"CmdlineEnter"},
	  ft = {"go", 'gomod'},
	  build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
	},
	{
	    'dklassen/note.nvim',
	    opts = {
	      -- opts.spaces are note workspace parent directories.
	      -- These directories contain a `notes` directory which will be created if missing.
	      -- `<space path>/notes` acts as the note root, so for space '~' the note root is `~/notes`.
	      -- Defaults to { '~' }.
	      spaces = {
		'~',
		-- '~/projects/foo'
	      },

	      -- Set keymap = false to disable keymapping
	      -- keymap = { 
	      --   prefix = '<leader>n'
	      -- }
	    },
	    cmd = 'Note',
	    ft = 'note',
	    keys = {
	      -- You can use telescope to search the current note space:
	      {'<leader>tn', -- [t]elescope [n]ote
		function()
		  require('telescope.builtin').live_grep({
		    cwd = require('note.api').current_note_root()
		  })
		end,
		mode = 'n'
	      }
	    }
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
