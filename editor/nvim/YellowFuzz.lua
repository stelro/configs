-- Theme: YellowFuzz (Adapted for modern C++)
-- Save this file as: ~/.config/nvim/colors/YellowFuzz.lua

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "YellowFuzz"

-- Palette
local C = {
    bg = "#181818",       -- Dark background
    fg = "#e8e8e8",       -- Standard text (Off-white)
    
    -- Core Accents
    yellow   = "#ffdd33", -- Main Yellow (Keywords, Loops)
    orange   = "#ff9b21", -- Bright Orange (Comments)
    copper   = "#CC7832", -- Copper (Numbers)
    green    = "#79bf46", -- Green (Strings)
    grey     = "#A9B7C6", -- Grey (Types)
    dark_grey= "#555555", -- Line Numbers
    
    error    = "#ff8080", -- Pastel Red
    warning  = "#ffcc80", -- Pastel Orange/Yellow
    info     = "#6796e6", -- Blue
    
    -- UI
    selection  = "#3d2f2f", 
    cursor_line= "#212121",
    search     = "#d38f8f",  -- Reddish
    
    -- C++ Specifics
    field      = "#bdae93",  -- Light brownish for members
    parameter  = "#d5c4a1",  -- Lightish for params
    namespace  = "#8ec07c",  -- Aqua/Greenish for namespaces (std::)
    macro      = "#d3869b",  -- Purpleish for macros
    function_c = "#83a598",  -- Blueish/Teal for functions (distinct from vars)
    constant   = "#d3869b",  -- Purple/Pink for constants/enums
    operator   = "#fe8019",  -- Orange for operators (<<, >>, +)
}

local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- 1. Editor UI
hl("Normal", { fg = C.fg, bg = C.bg })
hl("NormalFloat", { fg = C.fg, bg = C.bg })
hl("CursorLine", { bg = C.cursor_line })
hl("LineNr", { fg = C.dark_grey })
hl("CursorLineNr", { fg = C.yellow, bold = true })
hl("Visual", { bg = C.selection })
hl("Search", { fg = "#000000", bg = C.search })
hl("IncSearch", { fg = "#000000", bg = C.yellow })
hl("Pmenu", { bg = C.cursor_line, fg = C.fg }) 
hl("PmenuSel", { bg = C.selection, fg = C.fg, bold = true })
hl("ErrorMsg", { fg = C.error })
hl("WarningMsg", { fg = C.warning })

-- 2. Syntax (Standard)
hl("Comment", { fg = C.orange, italic = true })
hl("String", { fg = C.green })
hl("Number", { fg = C.copper })
hl("Boolean", { fg = C.yellow })
hl("Float", { fg = C.copper })
hl("Identifier", { fg = C.fg })
hl("Function", { fg = C.function_c }) 
hl("Statement", { fg = C.yellow }) 
hl("Conditional", { fg = C.yellow })
hl("Repeat", { fg = C.yellow })
hl("Label", { fg = C.yellow })
hl("Operator", { fg = C.operator })
hl("Keyword", { fg = C.yellow })
hl("Exception", { fg = C.yellow })
hl("PreProc", { fg = C.macro }) 
hl("Type", { fg = C.grey }) 
hl("Structure", { fg = C.yellow }) 
hl("Special", { fg = C.operator })
hl("Delimiter", { fg = C.fg }) -- Plain delimiters usually nice

-- 3. TreeSitter (Improved for C++)
hl("@variable", { fg = C.fg })
hl("@variable.builtin", { fg = C.yellow })  -- this
hl("@variable.member", { fg = C.field })    -- struct members
hl("@variable.parameter", { fg = C.parameter })

hl("@keyword", { fg = C.yellow })
hl("@keyword.function", { fg = C.yellow })
hl("@keyword.operator", { fg = C.operator }) -- new, delete
hl("@keyword.return", { fg = C.yellow, bold = true })

hl("@comment", { link = "Comment" })
hl("@string", { link = "String" })

hl("@function", { fg = C.function_c }) 
hl("@function.call", { fg = C.function_c }) 
hl("@function.builtin", { fg = C.yellow }) 
hl("@function.macro", { fg = C.macro }) 

hl("@constructor", { fg = C.yellow }) 
hl("@method", { fg = C.function_c })

hl("@type", { fg = C.grey }) 
hl("@type.builtin", { fg = C.yellow }) -- int, void (primitive)
hl("@type.qualifier", { fg = C.yellow }) -- const, static

hl("@namespace", { fg = C.namespace }) -- std:: (Now distinct!)

hl("@parameter", { fg = C.parameter }) 
hl("@operator", { fg = C.operator }) -- << >> ::

hl("@punctuation.bracket", { fg = C.fg })
hl("@punctuation.delimiter", { fg = C.fg }) -- , ;
hl("@number", { link = "Number" })      
hl("@constant", { fg = C.constant }) -- BIG_CAPS or enum members
hl("@constant.builtin", { fg = C.yellow }) -- true, false

-- 4. Diagnostics (LSP)
hl("DiagnosticError", { fg = C.error })
hl("DiagnosticWarn", { fg = C.warning })
hl("DiagnosticInfo", { fg = C.info })
hl("DiagnosticHint", { fg = C.grey })
