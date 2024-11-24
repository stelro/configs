-------------------------------------------------------------------------------
-- preferences
-------------------------------------------------------------------------------
--
-- never ever folding
vim.opt.foldenable = false
vim.opt.foldmethod = 'manual'
vim.opt.foldlevelstart = 99
-- keep more context on screen while scrolling
vim.opt.scrolloff = 2
-- never show me line breaks if they're not there
vim.opt.wrap = false
-- always draw sign column. prevents buffer moving when adding/deleting sign
vim.opt.signcolumn = 'yes'
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
-- tabs: go big or go home
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
-- Disable F1 in normal mode and map it to Escape
vim.keymap.set('n', '<F1>', '<Esc>', {noremap = true, silent = true})
-- Disable F1 in insert mode and map it to Escape
vim.keymap.set('i', '<F1>', '<Esc>', {noremap = true, silent = true})


-------------------------------------------------------------------------------
-- abbreviations 
-------------------------------------------------------------------------------
vim.cmd('abb conosle console')
vim.cmd('abb inlcude include')
vim.cmd('abb cosnt const')

-------------------------------------------------------------------------------
-- autocommands
-------------------------------------------------------------------------------
--
vim.api.nvim_create_autocmd(
    'TextYankPost',
    {
        pattern = '*',
        command = 'silent! lua vim.highlight.on_yank({ timeout = 500 })'
    }
)

-- run and execute various binary files
-- Autocommand for C++ files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<F1>', ":w <bar> exec '!clang++ -std=c++20 -Wall -Wextra -g -pthread -latomic '..shellescape('%')..' -o '..shellescape('%:r')..' && ./'..shellescape('%:r')<CR>", {noremap = true})
  end,
})

-- Autocommand for C files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<F1>', ":w <bar> exec '!clang -Wall -Wextra -g -O0 '..shellescape('%')..' -o '..shellescape('%:r')..' && ./'..shellescape('%:r')<CR>", {noremap = true})
  end,
})

-------------------------------------------------------------------------------
-- Key bindings that don't belong to mapping
----------------------------------------------------------------------------
-- Define the swap lines function
local function swap_lines(n1, n2)
    local line1 = vim.fn.getline(n1)
    local line2 = vim.fn.getline(n2)
    vim.fn.setline(n1, line2)
    vim.fn.setline(n2, line1)
end

-- Define the swap up function
local swap_up = function()
    local n = vim.fn.line('.')
    if n == 1 then
        return
    end
    swap_lines(n, n - 1)
    vim.api.nvim_win_set_cursor(0, {n - 1, 0})
end

-- Define the swap down function
local swap_down = function()
    local n = vim.fn.line('.')
    if n == vim.fn.line('$') then
        return
    end
    swap_lines(n, n + 1)
    vim.api.nvim_win_set_cursor(0, {n + 1, 0})
end

-- Create user commands for swapping
vim.api.nvim_create_user_command('SwapUp', swap_up, {})
vim.api.nvim_create_user_command('SwapDown', swap_down, {})
