-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}



M.base46 = {
	theme = "gruvchad",
	hl_override = {
	  Normal         = { fg = "#d5c4a1", bg = "#17191A" },
	  Bold           = {},
	  Debug          = { fg = "#fb4934" },
	  Directory      = { fg = "#83a598" },
	  Error          = { fg = "#17191A", bg = "#fb4934" },
	  ErrorMsg       = { fg = "#fb4934", bg = "#17191A" },
	  Exception      = { fg = "#fb4934" },
	  FoldColumn     = { fg = "#8ec07c", bg = "#1d2021" },
	  Folded         = { fg = "#665c54", bg = "#1d2021" },
	  IncSearch      = { fg = "#1d2021", bg = "#fe8019" },
	  Italic         = {},
	  Macro          = { fg = "#fb4934" },
	  MatchParen     = { bg = "#665c54" },
	  ModeMsg        = { fg = "#b8bb26" },
	  MoreMsg        = { fg = "#b8bb26" },
	  Question       = { fg = "#83a598" },
	  Search         = { fg = "#1d2021", bg = "#fabd2f" },
	  Substitute     = { fg = "#1d2021", bg = "#fabd2f" },
	  SpecialKey     = { fg = "#665c54" },
	  TooLong        = { fg = "#fb4934" },
	  Underlined     = { fg = "#fb4934" },
	  Visual         = { bg = "#504945" },
	  VisualNOS      = { fg = "#fb4934" },
	  WarningMsg     = { fg = "#fb4934" },
	  WildMenu       = { fg = "#fb4934", bg = "#fabd2f" },
	  Title          = { fg = "#83a598" },
	  Conceal        = { fg = "#83a598", bg = "#17191A" },
	  Cursor         = { fg = "#17191A", bg = "#d5c4a1" },
	  NonText        = { fg = "#665c54" },
	  LineNr         = { fg = "#665c54", bg = "#1d2021" },
	  SignColumn     = { fg = "#665c54", bg = "#1d2021" },
	  StatusLine     = { fg = "#bdae93", bg = "#504945" },
	  StatusLineNC   = { fg = "#665c54", bg = "#1d2021" },
	  VertSplit      = { fg = "#504945", bg = "#504945" },
	  ColorColumn    = { bg = "#1d2021" },
	  CursorColumn   = { bg = "#1d2021" },
	  CursorLine     = { bg = "#1d2021" },
	  CursorLineNr   = { fg = "#bdae93", bg = "#1d2021" },
	  QuickFixLine   = { bg = "#1d2021" },
	  PMenu          = { fg = "#d5c4a1", bg = "#1d2021" },
	  PMenuSel       = { fg = "#1d2021", bg = "#d5c4a1" },
	  TabLine        = { fg = "#665c54", bg = "#1d2021" },
	  TabLineFill    = { fg = "#665c54", bg = "#1d2021" },
	  TabLineSel     = { fg = "#b8bb26", bg = "#1d2021" },

	  -- Standard syntax
	  Boolean        = { fg = "#fe8019" },
	  Character      = { fg = "#fb4934" },
	  ["@comment"] = { fg = "#fe8019" },
	  Comment        = { fg = "#665c54" },
	  Conditional    = { fg = "#d3869b" },
	  Constant       = { fg = "#fe8019" },
	  Define         = { fg = "#d3869b" },
	  Delimiter      = { fg = "#d65d0e" },
	  Float          = { fg = "#fe8019" },
	  Function       = { fg = "#83a598" },
	  Identifier     = { fg = "#fb4934" },
	  Include        = { fg = "#83a598" },
	  Keyword        = { fg = "#d3869b" },
	  Label          = { fg = "#fabd2f" },
	  Number         = { fg = "#fe8019" },
	  Operator       = { fg = "#d5c4a1" },
	  PreProc        = { fg = "#fabd2f" },
	  Repeat         = { fg = "#fabd2f" },
	  Special        = { fg = "#8ec07c" },
	  SpecialChar    = { fg = "#d65d0e" },
	  Statement      = { fg = "#fb4934" },
	  StorageClass   = { fg = "#fabd2f" },
	  String         = { fg = "#b8bb26" },
	  Structure      = { fg = "#d3869b" },
	  Tag            = { fg = "#fabd2f" },
	  Todo = { fg = "#8ec07c", bg = "#17191A" },
	  Type           = { fg = "#fabd2f" },
	  Typedef        = { fg = "#fabd2f" },

	  -- C highlighting
	  cOperator      = { fg = "#8ec07c" },
	  cPreCondit     = { fg = "#d3869b" },

	  -- C# highlighting
	  csClass                = { fg = "#fabd2f" },
	  csAttribute            = { fg = "#fabd2f" },
	  csModifier             = { fg = "#d3869b" },
	  csType                 = { fg = "#fb4934" },
	  csUnspecifiedStatement = { fg = "#83a598" },
	  csContextualStatement  = { fg = "#d3869b" },
	  csNewDecleration       = { fg = "#fb4934" },

	  -- CSS highlighting
	  cssBraces      = { fg = "#d5c4a1" },
	  cssClassName   = { fg = "#d3869b" },
	  cssColor       = { fg = "#8ec07c" },

	  -- Diff highlighting
	  DiffAdd        = { fg = "#b8bb26", bg = "#1d2021" },
	  DiffChange     = { fg = "#665c54", bg = "#1d2021" },
	  DiffDelete     = { fg = "#fb4934", bg = "#1d2021" },
	  DiffText       = { fg = "#83a598", bg = "#1d2021" },
	  DiffAdded      = { fg = "#b8bb26", bg = "#17191A" },
	  DiffFile       = { fg = "#fb4934", bg = "#17191A" },
	  DiffNewFile    = { fg = "#b8bb26", bg = "#17191A" },
	  DiffLine       = { fg = "#83a598", bg = "#17191A" },
	  DiffRemoved    = { fg = "#fb4934", bg = "#17191A" },

	  -- Git highlighting
	  gitcommitOverflow       = { fg = "#fb4934" },
	  gitcommitSummary        = { fg = "#b8bb26" },
	  gitcommitComment        = { fg = "#665c54" },
	  gitcommitUntracked      = { fg = "#665c54" },
	  gitcommitDiscarded      = { fg = "#665c54" },
	  gitcommitSelected       = { fg = "#665c54" },
	  gitcommitHeader         = { fg = "#d3869b" },
	  gitcommitSelectedType   = { fg = "#83a598" },
	  gitcommitUnmergedType   = { fg = "#83a598" },
	  gitcommitDiscardedType  = { fg = "#83a598" },
	  gitcommitBranch         = { fg = "#fe8019" },
	  gitcommitUntrackedFile  = { fg = "#fabd2f" },
	  gitcommitUnmergedFile   = { fg = "#fb4934" },
	  gitcommitDiscardedFile  = { fg = "#fb4934" },
	  gitcommitSelectedFile   = { fg = "#b8bb26" },
	}
}

return M
