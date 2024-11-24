require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- General preferences
local opt = vim.opt

opt.foldenable = false
opt.foldmethod = 'manual'
opt.foldlevelstart = 99
opt.scrolloff = 2
opt.wrap = false
opt.signcolumn = 'yes'
opt.splitright = true
opt.splitbelow = true
opt.undofile = true
opt.wildmode = 'list:longest'
opt.wildignore = '.hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.swp,*.o,vendor,dist,_site'
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.expandtab = false
opt.ignorecase = true
opt.smartcase = true
opt.vb = true
opt.diffopt:append('iwhite')

-- Abbreviations
vim.cmd('iabbrev conosle console')
vim.cmd('iabbrev inlcude include')
vim.cmd('iabbrev cosnt const')

-- Autocommands

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  command = 'silent! lua vim.highlight.on_yank({ timeout = 500 })',
})

-- Run and execute binary files for C++ files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<F1>',
      ":w <bar> exec '!clang++ -std=c++20 -Wall -Wextra -g -pthread -latomic '..shellescape('%')..' -o '..shellescape('%:r')..' && ./'..shellescape('%:r')<CR>",
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

-- Disable F1 key
vim.keymap.set('n', '<F1>', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('i', '<F1>', '<Esc>', { noremap = true, silent = true })
