-- always set leader first!
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-------------------------------------------------------------------------------
--
-- preferences
--
-------------------------------------------------------------------------------
-- never ever folding
vim.opt.termguicolors = true
vim.opt.foldenable = false
vim.opt.foldmethod = 'manual'
vim.opt.foldlevelstart = 99
-- keep more context on screen while scrolling
vim.opt.scrolloff = 2
-- never show me line breaks if they're not there
vim.opt.wrap = false
-- always draw sign column. prevents buffer moving when adding/deleting sign
vim.opt.signcolumn = 'yes'
-- sweet sweet relative line numbers
vim.opt.relativenumber = true
-- and show the absolute line number for the current line
vim.opt.number = true
-- keep current content top + left when splitting
vim.opt.splitright = true
vim.opt.splitbelow = true
-- infinite undo!
-- NOTE: ends up in ~/.local/state/nvim/undo/
vim.opt.undofile = true
--" Decent wildmenu
-- in completion, when there is more than one match,
-- list all matches, and only complete to longest common match
vim.opt.wildmode = 'list:longest'
-- when opening a file with a command (like :e),
-- don't suggest files like there:
vim.opt.wildignore = '.hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.swp,*.o,vendor,dist,_site'
-- tabs
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = false
-- case-insensitive search/replace
vim.opt.ignorecase = true
-- unless uppercase in search term
vim.opt.smartcase = true
-- never ever make my terminal beep
vim.opt.vb = true
-- more useful diffs (nvim -d)
--- by ignoring whitespace
vim.opt.diffopt:append('iwhite')
--- and using a smarter algorithm
--- https://vimways.org/2018/the-power-of-diff/
--- https://stackoverflow.com/questions/32365271/whats-the-difference-between-git-diff-patience-and-git-diff-histogram
--- https://luppeng.wordpress.com/2020/10/10/when-to-use-each-of-the-git-diff-algorithms/
vim.opt.diffopt:append('algorithm:histogram')
vim.opt.diffopt:append('indent-heuristic')
-- show a column at 80 characters as a guide for long lines
vim.opt.colorcolumn = '100'
-- show more hidden characters
-- also, show tabs nicer
vim.opt.listchars = 'tab:^ ,nbsp:¬,extends:»,precedes:«,trail:•'
-- Wrap-broken line prefix (shows +++)
vim.opt.showbreak = "+++"  
-- Enable mouse usage
vim.opt.mouse = a
-- Highlight current line
vim.opt.cursorline = true

-- Abbreviations
vim.cmd('iabbrev conosle console')
vim.cmd('iabbrev inlcude include')
vim.cmd('iabbrev cosnt const')

-- Run and execute binary files for C++ files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<F1>',
      ":w <bar> exec '!clang++ -std=c++23 -Wall -Wextra -g -O0 -pthread -latomic '..shellescape('%')..' -o '..shellescape('%:r')..' && ./'..shellescape('%:r')<CR>",
      { noremap = true, silent = true })
  end,
})

-- Run and execute binary files for C files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<F1>',
      ":w <bar> exec '!clang -Wall -Wextra -g -O0 '..shellescape('%')..' -o '..shellescape('%:r')..' && ./'..shellescape('%:r')<CR>",
      { noremap = true, silent = true })
  end,
})

-- Key Bindings that Don’t Belong to Mappings
-- Define line swapping functions
local function swap_lines(n1, n2)
  local line1 = vim.fn.getline(n1)
  local line2 = vim.fn.getline(n2)
  vim.fn.setline(n1, line2)
  vim.fn.setline(n2, line1)
end

local swap_up = function()
  local n = vim.fn.line('.')
  if n == 1 then
    return
  end
  swap_lines(n, n - 1)
  vim.api.nvim_win_set_cursor(0, { n - 1, 0 })
end

local swap_down = function()
  local n = vim.fn.line('.')
  if n == vim.fn.line('$') then
    return
  end
  swap_lines(n, n + 1)
  vim.api.nvim_win_set_cursor(0, { n + 1, 0 })
end

vim.api.nvim_create_user_command('SwapUp', swap_up, {})
vim.api.nvim_create_user_command('SwapDown', swap_down, {})


-------------------------------------------------------------------------------
--
-- hotkeys
--
-------------------------------------------------------------------------------
-- quick-open
vim.keymap.set('', '<leader>p', '<cmd>Files<cr>')
-- search in project directory
vim.keymap.set('', '<leader>gg', '<cmd>GGFiles<cr>')
-- search buffers
vim.keymap.set('n', '<leader>bb', '<cmd>Buffers<cr>')
vim.keymap.set('n', '<leader>a', '<cmd>Buffers<cr>')
-- quick-save
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')
-- make missing : less annoying
vim.keymap.set('n', ';', ':')
-- close current buffer
vim.keymap.set('n', '<leader>bd', '<cmd>bd<cr>')
-- next buffer
vim.keymap.set('n', 'gt', '<cmd>bnext<cr>')
-- previous buffer
vim.keymap.set('n', 'tg', '<cmd>bprev<cr>')
-- Switch between active panels
vim.keymap.set('n', '<leader>el', '<C-w>w', { noremap = true, silent = true })
-- Enable spell-checker
vim.keymap.set('n', '<leader>sc', '<cmd>set spell spelllang=en_us<cr>')
-- Disable spell-checker
vim.keymap.set('n', '<leader>sd', '<cmd>set nospell<cr>')
-- Split window vertically
vim.keymap.set('n', '<leader>w/', '<cmd>vsplit<cr>')
-- hide/close window pane
vim.keymap.set('n', '<leader>wd', '<cmd>hide<cr>')
-- Duplicate current line
vim.keymap.set('n', "<leader>dd", ":s/\\(^.*$\\)/\\1\\r\\1/<CR>:noh<CR>")
-- Swap lines
vim.keymap.set("n", "<leader>kk", ":SwapUp<CR>")
vim.keymap.set("n", "<leader>jj", ":SwapDown<CR>")
-- Disable F1 key
vim.keymap.set('n', '<F1>', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('i', '<F1>', '<Esc>', { noremap = true, silent = true })
-- nvimtree
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")
-- Comment
vim.keymap.set("n", "<leader>/", "gcc")
vim.keymap.set("v", "<leader>/", "gc")
-- Regex Search in a project (best command)
vim.keymap.set('n', "<leader>f", "<cmd>Rg!<CR>")

-------------------------------------------------------------------------------
--
-- autocommands
--
-------------------------------------------------------------------------------
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- highlight yanked text
vim.api.nvim_create_autocmd(
	'TextYankPost',
	{
		pattern = '*',
		command = 'silent! lua vim.highlight.on_yank({ timeout = 500 })'
	}
)
-- jump to last edit position on opening file
vim.api.nvim_create_autocmd(
	'BufReadPost',
	{
		pattern = '*',
		callback = function(ev)
			if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
				-- except for in git commit messages
				-- https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
				if not vim.fn.expand('%:p'):find('.git', 1, true) then
					vim.cmd('exe "normal! g\'\\""')
				end
			end
		end
	}
)
-- prevent accidental writes to buffers that shouldn't be edited
vim.api.nvim_create_autocmd('BufRead', { pattern = '*.orig', command = 'set readonly' })
vim.api.nvim_create_autocmd('BufRead', { pattern = '*.pacnew', command = 'set readonly' })
-- leave paste mode when leaving insert mode (if it was on)
vim.api.nvim_create_autocmd('InsertLeave', { pattern = '*', command = 'set nopaste' })
-- help filetype detection (add as needed)
--vim.api.nvim_create_autocmd('BufRead', { pattern = '*.ext', command = 'set filetype=someft' })
-- correctly classify mutt buffers
local email = vim.api.nvim_create_augroup('email', { clear = true })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
	pattern = '/tmp/mutt*',
	group = email,
	command = 'setfiletype mail',
})
-- also, produce "flowed text" wrapping
-- https://brianbuccola.com/line-breaks-in-mutt-and-vim/
vim.api.nvim_create_autocmd('Filetype', {
  pattern = 'mail',
  group = email,
  command = 'setlocal formatoptions+=w',
})
-- shorter columns in text because it reads better that way
local text = vim.api.nvim_create_augroup('text', { clear = true })
for _, pat in ipairs({'text', 'markdown', 'mail', 'gitcommit'}) do
	vim.api.nvim_create_autocmd('Filetype', {
		pattern = pat,
		group = text,
		command = 'setlocal spell tw=72 colorcolumn=73',
	})
end
--- tex has so much syntax that a little wider is ok
vim.api.nvim_create_autocmd('Filetype', {
	pattern = 'tex',
	group = text,
	command = 'setlocal spell tw=80 colorcolumn=81',
})
-------------------------------------------------------------------------------
--
-- plugin configuration
--
-------------------------------------------------------------------------------
-- first, grab the manager
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
-- then, setup!
require("lazy").setup({
	-- main color scheme
	{
		"wincent/base16-nvim",
		lazy = false, -- load at start
		priority = 1000, -- load first
		config = function()
			vim.cmd([[colorscheme gruvbox-dark-hard]])
			vim.o.background = 'dark'
			-- Less visible window separator
			vim.api.nvim_set_hl(0, "WinSeparator", { fg = 1250067 })
			-- Make comments more prominent -- they are important.
			local bools = vim.api.nvim_get_hl(0, { name = 'Boolean' })
			vim.api.nvim_set_hl(0, 'Comment', bools)
			-- Make it clearly visible which argument we're at.
			local marked = vim.api.nvim_get_hl(0, { name = 'PMenu' })
			vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = marked.fg, bg = marked.bg, ctermfg = marked.ctermfg, ctermbg = marked.ctermbg, bold = true })
			-- LSP: C++
			-- Class & struct names (red instead of yellow)
			vim.api.nvim_set_hl(0, '@type.cpp', { fg = '#fabd2f' })
			vim.api.nvim_set_hl(0, '@lsp.type.class.cpp', { fg = '#fabd2f' })
			vim.api.nvim_set_hl(0, '@lsp.type.struct.cpp', { fg = '#fabd2f' })
			vim.api.nvim_set_hl(0, '@type', { fg = '#fb4934' })  -- fallback if needed

			-- Types and 'auto' keyword (purple)
			vim.api.nvim_set_hl(0, '@type.builtin.cpp', { fg = '#d3869b' })
			vim.api.nvim_set_hl(0, '@lsp.type.builtinType.cpp', { fg = '#d3869b' })
			vim.api.nvim_set_hl(0, '@lsp.type.type.cpp', { fg = '#d3869b' })
			vim.api.nvim_set_hl(0, '@lsp.type.type', { fg = '#d3869b' })

			-- Variable names (light gray for all variables)
			vim.api.nvim_set_hl(0, '@variable', { fg = '#d5c4a1' })
			vim.api.nvim_set_hl(0, '@lsp.type.variable.cpp', { fg = '#d5c4a1' })
			vim.api.nvim_set_hl(0, '@lsp.type.variable', { fg = '#d5c4a1' })

			-- Function parameter names (light gray)
			vim.api.nvim_set_hl(0, '@parameter', { fg = '#d5c4a1' })
			vim.api.nvim_set_hl(0, '@lsp.type.parameter.cpp', { fg = '#d5c4a1' })
			vim.api.nvim_set_hl(0, '@lsp.type.parameter', { fg = '#d5c4a1' })

			-- 'delete' and 'new' keywords (green)
			vim.api.nvim_set_hl(0, '@keyword.operator.cpp', { fg = '#83a598' })
			vim.api.nvim_set_hl(0, '@lsp.type.keyword', { fg = '#83a598' })
			vim.api.nvim_set_hl(0, '@keyword.modifier.cpp', { fg = '#83a598' })
			vim.api.nvim_set_hl(0, '@variable.member', { fg = '#d5c4a1' })

			vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "#d5c4a1" })
			vim.api.nvim_set_hl(0, "@lsp.typemod.parameter.readonly.cpp", { fg = "#d5c4a1" })
			vim.api.nvim_set_hl(0, "@lsp.typemod.parameter.readonly", { fg = "#d5c4a1" })
			vim.api.nvim_set_hl(0, "@lsp.typemod.parameter.mutable.cpp", { fg = "#d5c4a1" })
			vim.api.nvim_set_hl(0, "@lsp.typemod.parameter.mutable", { fg = "#d5c4a1" })

			vim.api.nvim_set_hl(0, '@keyword.import', { fg = "#d3869b", ctermfg = cterm0E, italic = false })
			vim.api.nvim_set_hl(0, 'DiagnosticUnnecessary', {  underline = true })
			vim.api.nvim_set_hl(0, '@constant.builtin', { fg = "#d3869b", italic = false })
		end
	},
	{
		  "nvim-treesitter/nvim-treesitter",
		  branch = "master", -- will switch to main in the future
		  lazy = false,      -- load at startup as recommended
		  build = ":TSUpdate", -- always keep parsers up to date
		 config = function()
			require("nvim-treesitter.configs").setup {
			  ensure_installed = { "cpp", "c", "vim", "lua", "query", "vimdoc", "markdown", "markdown_inline" }, -- add more as needed
			  auto_install = true,
			  highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			  },
			}
		 end,
	},
    -- nice bar at the bottom
	{
		'itchyny/lightline.vim',
		lazy = false, -- also load at start since it's UI
		config = function()
			-- no need to also show mode in cmd line when we have bar
			vim.o.showmode = false
			vim.g.lightline = {
				active = {
					left = {
						{ 'mode', 'paste' },
						{ 'readonly', 'filename', 'modified' }
					},
					right = {
						{ 'lineinfo' },
						{ 'percent' },
						{ 'fileencoding', 'filetype' }
					},
				},
				component_function = {
					filename = 'LightlineFilename'
				},
			}
			function LightlineFilenameInLua(opts)
				if vim.fn.expand('%:t') == '' then
					return '[No Name]'
				else
					return vim.fn.getreg('%')
				end
			end
			-- https://github.com/itchyny/lightline.vim/issues/657
			vim.api.nvim_exec(
				[[
				function! g:LightlineFilename()
					return v:lua.LightlineFilenameInLua()
				endfunction
				]],
				true
			)
		end
	},
    -- quick navigation
	{
		'ggandor/leap.nvim',
		config = function()
			local leap = require('leap')
			-- Use custom mappings to avoid conflicts
			vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-forward)')
			vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-backward)')
			vim.keymap.set({'n', 'x', 'o'}, 'gS', '<Plug>(leap-from-window)')
		end
	},
	-- better %
	{
		'andymass/vim-matchup',
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end
	},
	-- auto-cd to root of git project
	-- 'airblade/vim-rooter'
	{
		'notjedi/nvim-rooter.lua',
		config = function()
			require('nvim-rooter').setup()
		end
	},
	{
		"junegunn/fzf",
		 build = "./install --all",
	},
	-- fzf support for ^p
	{
		'junegunn/fzf.vim',
		dependencies = {
			{ 'junegunn/fzf', build = './install --all' },
		},
		config = function()
			-- stop putting a giant window over my editor
			vim.g.fzf_layout = { down = '~30%' }
			-- when using :Files, pass the file list through
			--
			--   https://github.com/jonhoo/proximity-sort
			--
			-- to prefer files closer to the current file.
			function list_cmd()
				local base = vim.fn.fnamemodify(vim.fn.expand('%'), ':h:.:S')
				if base == '.' then
					-- if there is no current file,
					-- proximity-sort can't do its thing
					return 'fd --hidden --type file --follow'
				else
					return vim.fn.printf('fd --hidden --type file --follow | proximity-sort %s', vim.fn.shellescape(vim.fn.expand('%')))
				end
			end
			vim.api.nvim_create_user_command('Files', function(arg)
				vim.fn['fzf#vim#files'](arg.qargs, { source = list_cmd(), options = '--scheme=path --tiebreak=index' }, arg.bang)
			end, { bang = true, nargs = '?', complete = "dir" })
			vim.api.nvim_create_user_command("GGFiles", function()
		    vim.fn["fzf#run"](vim.fn["fzf#wrap"]({
				source = [[if [ -d .git ] ; then git ls-files -co --exclude-standard ; elif [ -d .hg ] ; then hg locate ; else find . ; fi]],
				sink = "e"
		  }))
	  end, {})
		end
	},
    -- LSP
	{
	  'neovim/nvim-lspconfig',
	  config = function()
		local caps = vim.lsp.protocol.make_client_capabilities()
		pcall(function()
		  caps = require('cmp_nvim_lsp').default_capabilities(caps)
		end)

		-- Rust (rust-analyzer)
		vim.lsp.config.rust_analyzer = {
		  capabilities = caps,
		  settings = {
			["rust-analyzer"] = {
			  cargo = { features = "all" },
			  checkOnSave = { enable = true },
			  check = { command = "clippy" },
			  imports = { group = { enable = false } },
			  completion = { postfix = { enable = false } },
			},
		  },
		}

		-- C/C++ (clangd)
		vim.lsp.config.clangd = {
		  capabilities = caps,
		  cmd = {
			"clangd",
			"--background-index",
			"--clang-tidy",
			"--query-driver=/usr/bin/clang++",
			"--query-driver=/usr/bin/clang",
			"--query-driver=/usr/bin/gcc",
			"--query-driver=/usr/bin/g++",
		  },
		  filetypes = { "c", "cpp", "h", "hpp" },
		  -- root_dir → root_markers in the new API
		  root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
		}

		-- Bash (bashls)  — use the standard server id "bashls"
		vim.lsp.config.bashls = {
		  capabilities = caps,
		  cmd = { "bash-language-server", "start" },
		  filetypes = { "sh", "bash" },
		}

		-- Python Ruff (ruff language server) — recommended over defunct ruff-lsp
		-- See official Ruff docs for 0.11+ config+enable usage.
		vim.lsp.config('ruff', {
		  capabilities = caps,
		  cmd = { 'ruff', 'server' },
		  init_options = {
			settings = {
			  -- put your Ruff LSP settings here if needed
			  -- e.g. logLevel = "info",
			},
		  },
		})

		-- Finally, enable the servers you want:
		vim.lsp.enable({ 'rust_analyzer', 'clangd', 'bashls', 'ruff' })

		-- Your existing LspAttach autocommand is good; keep it as-is.
		vim.api.nvim_create_autocmd('LspAttach', {
		  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
		  callback = function(ev)
			vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
			local opts = { buffer = ev.buf }
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
			vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
			vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
			vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
			vim.keymap.set({ 'n', 'v' }, '<leader>t', vim.lsp.buf.code_action, opts)
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
			vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)

			local client = vim.lsp.get_client_by_id(ev.data.client_id)
			-- If you still want to disable semantic tokens:
			if client then client.server_capabilities.semanticTokensProvider = nil end
		  end,
		})
	  end,
	},
	-- LSP-based code-completion
	{
		"hrsh7th/nvim-cmp",
		-- load cmp on InsertEnter
		event = "InsertEnter",
		-- these dependencies will only be loaded when cmp loads
		-- dependencies are always lazy-loaded unless specified otherwise
		dependencies = {
			'neovim/nvim-lspconfig',
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require'cmp'
			cmp.setup({
				snippet = {
					-- REQUIRED by nvim-cmp. get rid of it once we can
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					-- Accept currently selected item.
					-- Set `select` to `false` to only confirm explicitly selected items.
					['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
				}, {
					{ name = 'path' },
				}),
				experimental = {
					ghost_text = true,
				},
			})

			-- Enable completing paths in :
			cmp.setup.cmdline(':', {
				sources = cmp.config.sources({
					{ name = 'path' }
				})
			})
		end
	},
	-- inline function signatures
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			-- Get signatures (and _only_ signatures) when in argument lists.
			require "lsp_signature".setup({
				doc_lines = 0,
				handler_opts = {
					border = "none"
				},
			})
		end
	},
	-- language support
	-- toml
	'cespare/vim-toml',
	-- yaml
	{
		"cuducos/yaml.nvim",
		ft = { "yaml" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	-- rust
	{
		'rust-lang/rust.vim',
		ft = { "rust" },
		config = function()
			vim.g.rustfmt_autosave = 1
			vim.g.rustfmt_emit_files = 1
			vim.g.rustfmt_fail_silently = 0
			vim.g.rust_clip_command = 'wl-copy'
		end
	},
	-- fish
	'khaveesh/vim-fish-syntax',
	-- markdown
	{
		'plasticboy/vim-markdown',
		ft = { "markdown" },
		dependencies = {
			'godlygeek/tabular',
		},
		config = function()
			-- never ever fold!
			vim.g.vim_markdown_folding_disabled = 1
			-- support front-matter in .md files
			vim.g.vim_markdown_frontmatter = 1
			-- 'o' on a list item should insert at same level
			vim.g.vim_markdown_new_list_item_indent = 0
			-- don't add bullets when wrapping:
			-- https://github.com/preservim/vim-markdown/issues/232
			vim.g.vim_markdown_auto_insert_bullets = 0
		end
	},
    -- rooter 
    {
        "notjedi/nvim-rooter.lua",
    },
    -- file managing , picker etc
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        config = function() 
            local tree = require('nvim-tree');
            tree.setup {
                filters = { dotfiles = false },
                disable_netrw = true,
                hijack_cursor = true,
                sync_root_with_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_root = false,
                },
                view = {
                    width = 30,
                    preserve_window_proportions = true,
                },
                 renderer = {
                    root_folder_label = false,
                    highlight_git = true,
                    indent_markers = { enable = true },
                    icons = {
                        glyphs = {
                        default = "*",
                        folder = {
                            default = "-",
                            empty = "",
                            empty_open = "",
                            open = "",
                            symlink = "",
                        },
                        git = { unmerged = "" },
                        },
                    },
                },
            }
        end

    },
    {
	  "rmagatti/auto-session",
	  lazy = false,
	  config = function()
		require("auto-session").setup {
		  log_level = "error",
		  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		}
	  end,
	},
	-- Debugging support
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Setup dap-ui
			dapui.setup({
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 0.25 },
							{ id = "breakpoints", size = 0.25 },
							{ id = "stacks", size = 0.25 },
							{ id = "watches", size = 0.25 },
						},
						size = 40,
						position = "left",
					},
					{
						elements = {
							{ id = "repl", size = 0.5 },
							{ id = "console", size = 0.5 },
						},
						size = 10,
						position = "bottom",
					},
				},
			})

			-- C++ configuration using lldb-dap
			dap.adapters.lldb = {
				type = 'executable',
				command = 'lldb-dap',
				name = 'lldb'
			}

			dap.configurations.cpp = {
				{
					name = "Launch",
					type = "lldb",
					request = "launch",
					program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
					cwd = '${workspaceFolder}',
					stopOnEntry = false,
					args = {},
					runInTerminal = false,
				},
				{
					name = "Debug current file",
					type = "lldb",
					request = "launch",
					program = function()
						local file = vim.fn.expand('%:r')
						return vim.fn.getcwd() .. '/' .. file
					end,
					cwd = '${workspaceFolder}',
					stopOnEntry = false,
					args = {},
					runInTerminal = false,
				},
			}

			-- Use the same config for C
			dap.configurations.c = dap.configurations.cpp

			-- Auto-open/close dapui
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Debugging keybindings
			vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
			vim.keymap.set('n', '<leader>dc', dap.continue, { desc = "Continue debugging" })
			vim.keymap.set('n', '<leader>ds', dap.step_over, { desc = "Step over" })
			vim.keymap.set('n', '<leader>di', dap.step_into, { desc = "Step into" })
			vim.keymap.set('n', '<leader>do', dap.step_out, { desc = "Step out" })
			vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = "Open REPL" })
			vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = "Terminate debugging" })
			vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = "Toggle debug UI" })
		end,
	},
})
