require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Debugger Keybindings (DAP)
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint at the current line" })
map("n", "<leader>dr", "<cmd>DapContinue<CR>", { desc = "Start or continue the debugger" })

-- General Keybindings
map("n", "<leader>of", "<cmd>ClangdSwitchSourceHeader<CR>", { desc = "Switch between source and header files" })
map("n", "<leader>w/", ":vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>wd", ":hide<CR>", { desc = "Close the current pane" })
map("n", "<leader>wl", "<C-w><C-w>", { desc = "Switch to the next window" })
map("n", "<leader>dd", ":s/\\(^.*$\\)/\\1\\r\\1/<CR>:noh<CR>", { desc = "Duplicate the current line" })
map("n", "<leader>sc", ":set spell spelllang=en_us<CR>", { desc = "Enable spell-checker with US English" })
map("n", "<leader>sd", ":set nospell<CR>", { desc = "Disable spell-checker" })
map("n", "<leader>kk", ":SwapUp<CR>", { desc = "Swap the current line with the one above it" })
map("n", "<leader>jj", ":SwapDown<CR>", { desc = "Swap the current line with the one below it" })

-- Rust Crates Keybindings
map("n", "<leader>rcu", function()
    require("crates").upgrade_all_crates()
end, { desc = "Upgrade all Rust crates" })
