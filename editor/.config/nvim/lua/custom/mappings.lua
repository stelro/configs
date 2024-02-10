local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    }
  }
}

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
        ["<leader>dd"] = {
            ":s/\\(^.*$\\)/\\1\\r\\1/<CR>:noh<CR>",
            "Duplicate current line"
        },
        ["<leader>sc"] = {
            ":set spell spelllang=en_us<CR>",
            "Enable spell-checker"
        },
        ["<leader>sd"] = {
            ":set nospell",
            "Disable spell-checker"
        }
    }
}

return M
