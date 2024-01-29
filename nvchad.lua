--> lua/custom/init.lua:

vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.undofile = true
vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.cmd('abb conosle console')
vim.cmd('abb inlcude include')
vim.cmd('abb cosnt const')

--> lua/custom/plugins.lua

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
  -- Custom plugins
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

--> lua/custom/mappings.lua


M.general = {
  n = {
	 ["<leader>of"] = {
	   "<cmd> ClangdSwitchSourceHeader <CR>",
	   "Switch between header file and source file",
	 },
	 ["<leader>w/"] = {
		":vsplit <CR>",
		"Vertical pane split"
	 },
	 ["<leader>wd"] = {
		":hide <CR>",
		"Hide current pane"
	 },
	 ["<leader>wl"] = {
		"<C-w><C-w>",
		"Switch between panes"
	 },
  }
}

