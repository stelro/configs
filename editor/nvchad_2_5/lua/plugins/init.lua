return {
	{
	"stevearc/conform.nvim",
	-- event = 'BufWritePre', -- uncomment for format on save
	opts = require "configs.conform",
	},
	{
	"neovim/nvim-lspconfig",
	config = function()
	  require "configs.lspconfig"
	end,
	},
	{
	  "rcarriga/nvim-dap-ui",
	  event = "VeryLazy",
	  dependencies = "mfussenegger/nvim-dap",
	  config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup()
		dap.listeners.after.event_initialized["dapui_config"] = function()
		  dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
		  dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
		  dapui.close()
		end
	  end,
	},
	{
	  "jay-babu/mason-nvim-dap.nvim",
	  event = "VeryLazy",
	  dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	  },
	  opts = {
		handlers = {},
	  },
	},
	{
	  "mfussenegger/nvim-dap",
	  config = function()
		-- Add your custom mappings for DAP here instead of `core.utils`
		local map = vim.keymap.set
		map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint" })
		map("n", "<leader>dr", "<cmd>DapContinue<CR>", { desc = "Continue Debugging" })
	  end,
	},
	{
	  "jose-elias-alvarez/null-ls.nvim",
	  event = "VeryLazy",
	  opts = function()
		return require "configs.null-ls"
	  end,
	},
	{
	  "williamboman/mason.nvim",
	  opts = {
		ensure_installed = {
		  "clangd",
		  "clang-format",
		  "codelldb",
		  "rust-analyzer",
		},
	  },
	},
	{
	  "nvim-telescope/telescope.nvim",
	  opts = {
		defaults = {
		  file_ignore_patterns = {
			"cmake-build-debug/",
			"cmake-build-release/",
			".idea/",
			".clangd/",
			"cmake-build-debug-rhel7-build-lnx86/",
			".cache/",
			".git/",
			"lnx86/",
			"lnx86_32b/",
			"wint/",
			"lna64/",
			"lnppc/",
			"mca64/",
			"mcx86/",
			"doc/",
		  },
		},
	  },
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
	{
	  "rust-lang/rust.vim",
	  ft = "rust",
	  init = function()
		vim.g.rustfmt_autosave = 1
	  end,
	},
	{
	  "saecki/crates.nvim",
	  ft = { "rust", "toml" },
	  config = function(_, opts)
		local crates = require("crates")
		crates.setup(opts)
		crates.show()
	  end,
	},
	{
	  "mrcjkb/rustaceanvim",
	  version = "^4",
	  ft = { "rust" },
	  dependencies = "neovim/nvim-lspconfig",
	  config = function()
		require "c.onfigs.rustaceanvim"
	  end,
	},
	{
	  "theHamsta/nvim-dap-virtual-text",
	  lazy = false,
	  config = function(_, opts)
		require("nvim-dap-virtual-text").setup()
	  end,
	},
	{
		"nvim-neotest/nvim-nio",
	},
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css", "cpp"
  		},
  	},
  },
}
