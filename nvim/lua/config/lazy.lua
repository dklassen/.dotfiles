-- Bootstrap lazy.nvim
--
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)
vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Add fzf to the runtime path
vim.opt.runtimepath:append("/usr/local/opt/fzf")

-- Disable the space key as a normal mode mapping
vim.keymap.set("n", "<Space>", "<Nop>", { noremap = true, silent = true })

-- Set the leader key to space
vim.g.mapleader = " "

-- Enable line numbers
vim.opt.number = true

-- Disable line wrapping
vim.opt.wrap = false

-- Show the ruler
vim.opt.ruler = true

-- Enable syntax highlighting
vim.cmd("syntax enable")

-- Define a custom command for searching with fzf
vim.api.nvim_create_user_command(
  "Find",
  function(opts)
    local cmd = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" ' .. vim.fn.shellescape(opts.args)
    vim.fn["fzf#vim#grep"](cmd, 1, opts.bang == "!")
  end,
  { bang = true, nargs = "*" }
)

-- Key mappings
vim.keymap.set("n", "<Leader>f", ":GFiles<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>F", ":Files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>t", ":Rg<CR>", { noremap = true, silent = true })

require("lazy").setup({
	spec = {
          { import = "plugins" },
        },
})

require('nvim-treesitter.configs').setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- List of parsers to ignore installing (or "all")
	ignore_install = { "javascript" },

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		disable = { "c", "rust" },
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})


require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})

require("mason-lspconfig").setup({
    ensure_installed = { "ts_ls" }
})

local lspconfig = require("lspconfig")
lspconfig.ts_ls.setup({
    settings = {
        typescript = {
            format = { enable = false }, -- Prevents tsserver from formatting (we'll use Prettier)
        },
    },
})

-- Setup GoLang LSP
lspconfig.gopls.setup({
    cmd = { "gopls" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        vim.lsp.buf.format({ async = true })
    end,
})
-- End GoLang LSP

vim.api.nvim_set_keymap('n', '<Leader>c', '<Plug>RestNvim', { noremap = false, silent = true })

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
	null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettier, -- Enables Prettier formatting
    },
})

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>p", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
