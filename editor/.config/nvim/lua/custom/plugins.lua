local plugins = {
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
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
      }
    }
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
		}
	  }
    }
  },
  {
   "rmagatti/auto-session",
   lazy = false,
   config = function()
   require("auto-session").setup {
     log_level = "error",
     auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
   }
  end
},
}
return plugins
