-- Theme: Tsoding Dark for Neovim
-- Save this file as: ~/.config/nvim/colors/tsoding.lua

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "tsoding"

-- Palette based on your JSON
local C = {
    bg = "#181818",
    fg = "#e8e8e8",           -- Standard text
    comment = "#ff9b21",      -- Bright Orange (Signature)
    string = "#79bf46",       -- Green
    keyword = "#ffdd33",      -- Yellow
    -- type = "#bfc5bf",         -- Greyish (for types, macros)
    type = "#A9B7C6",         -- Greyish (for types, macros)
	number = "#CC7832",       -- Copper (Numbers)
    operator = "#bfc5bf",     -- Greyish
    punctuation = "#bfc5bf",  -- Greyish
    namespace = "#919191",    -- Dark Grey
    
    error = "#c22121",
    warning = "#c2aa21",
    info = "#6796e6",
    
    selection = "#3d2f2f",    -- Calculated reddish dark
    line_nr = "#555555",      -- Grey
    cursor_line = "#212121",  -- Slightly lighter dark
    visual = "#3d2f2f",
    search = "#d38f8f",       -- Reddish highlight
}

local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- 1. Editor UI
hl("Normal", { fg = C.fg, bg = C.bg })
hl("NormalFloat", { fg = C.fg, bg = C.bg })
hl("CursorLine", { bg = C.cursor_line })
hl("LineNr", { fg = C.line_nr })
hl("CursorLineNr", { fg = C.keyword, bold = true })
hl("Visual", { bg = C.visual })
hl("Search", { fg = "#000000", bg = C.search })
hl("IncSearch", { fg = "#000000", bg = C.keyword })
hl("Pmenu", { bg = C.cursor_line, fg = C.fg }) -- Popup menu
hl("PmenuSel", { bg = C.selection, fg = C.fg, bold = true })

-- 2. Syntax (Standard)
hl("Comment", { fg = C.comment, italic = true })
hl("String", { fg = C.string })
hl("Number", { fg = C.number })
hl("Boolean", { fg = C.keyword })
hl("Float", { fg = C.number })
hl("Identifier", { fg = C.fg })
hl("Function", { fg = C.fg }) -- Tsoding theme keeps functions plain white usually
hl("Statement", { fg = C.keyword }) -- if, else, while
hl("Conditional", { fg = C.keyword })
hl("Repeat", { fg = C.keyword })
hl("Label", { fg = C.keyword })
hl("Operator", { fg = C.operator })
hl("Keyword", { fg = C.keyword })
hl("Exception", { fg = C.keyword })
hl("PreProc", { fg = C.keyword }) -- #include, #define
hl("Type", { fg = C.type }) -- int, long, char
hl("Structure", { fg = C.keyword }) -- struct, class, enum
hl("Special", { fg = C.operator })
hl("Delimiter", { fg = C.punctuation })

-- 3. TreeSitter (Critical for C++)
-- These link TreeSitter nodes to our palette
hl("@variable", { fg = C.fg })
hl("@variable.builtin", { fg = C.keyword })
hl("@keyword", { fg = C.keyword })
hl("@keyword.function", { fg = C.keyword })
hl("@comment", { link = "Comment" })
hl("@string", { link = "String" })
hl("@function", { fg = C.fg }) -- C++ Functions
hl("@function.macro", { fg = C.type }) -- Macros (Grey)
hl("@method", { fg = C.fg })
hl("@constructor", { fg = C.type })
hl("@type", { fg = C.type }) -- int, bool
hl("@type.builtin", { fg = C.keyword })
hl("@namespace", { fg = C.namespace }) -- std:: (Dark Grey)
hl("@parameter", { fg = "#e2e2e2" }) -- Parameters (White)
hl("@operator", { fg = C.operator })
hl("@punctuation.bracket", { fg = C.punctuation })
hl("@punctuation.delimiter", { fg = C.punctuation })
hl("@number", { link = "Number" })      -- Links to your new copper color

-- 4. Diagnostics (LSP)
hl("DiagnosticError", { fg = C.error })
hl("DiagnosticWarn", { fg = C.warning })
hl("DiagnosticInfo", { fg = C.info })
hl("DiagnosticHint", { fg = C.type })
