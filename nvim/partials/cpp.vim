command! Ctagsgenerate :!ctags -R .
command! Gtagsgenerate :!gtags

"compile and run single source file without leaving vim
autocmd filetype cpp nnoremap <f8> :w <bar> exec '!g++ -std=c++17 -Wall -Wextra -g -pthread '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<cr>
autocmd filetype c nnoremap <f8> :w <bar> exec '!gcc  -Wall -Wextra -g -O0 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<cr>
autocmd filetype ruby nnoremap <F8> :w <bar> exec '!ruby '.shellescape('%')<CR>
autocmd filetype javascript nnoremap <F8> :w <bar> exec '!/usr/bin/node '.shellescape('%')<CR>
autocmd filetype lua nnoremap <F8> :w <bar> exec '!/usr/bin/lua5.3 '.shellescape('%')<CR>
autocmd filetype jsx nnoremap <F8> :w <bar> exec '!/usr/bin/node '.shellescape('%')<CR>
autocmd filetype javascript.jsx nnoremap <F8> :w <bar> exec '!/usr/bin/node '.shellescape('%')<CR>
autocmd filetype pl nnoremap <F8> :w <bar> exec '!perl '.shellescape('%')<CR>
autocmd filetype python nnoremap <F8> :w <bar> exec '!python3 '.shellescape('%')<CR>
autocmd filetype rust nnoremap <F8> :w <bar> exec '!rustc '.shellescape('%')<CR>

" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
" The following two lines are optional. Configure it to your liking!
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" CLANG FORMAT
" default settings
let g:clang_format#code_style = "llvm"
let g:clang_format#style_options = {
      \ "AllowShortFunctionsOnASingleLine": "Empty",
      \ "AlwaysBreakTemplateDeclarations": "true",
      \ "ColumnLimit": 100,
      \ "BreakBeforeBraces": "Custom",
      \ "BreakConstructorInitializersBeforeComma": "true",
      \ "IndentCaseLabels": "true",
      \ "IndentWidth": 4,
      \ "MaxEmptyLinesToKeep": 2,
      \ "NamespaceIndentation": "None",
      \ "BraceWrapping": {
      \   "AfterEnum": "false",
      \   "AfterStruct": "false",
      \   "AfterControlStatement": "false",
      \   "AfterFunction": "false",
      \   "AfterNamespace": "false",
      \   "BeforeElse": "false"},
      \ "ObjCBlockIndentWidth": 4,
      \ "SpacesBeforeTrailingComments": 4,
      \ "SpacesInCStyleCastParentheses": "true",
      \ "SpacesInContainerLiterals": "true",
      \ "SpacesInParentheses": "false",
      \ "SpacesInSquareBrackets": "false",
      \ "AlignTrailingComments": "true",
      \ "AccessModifierOffset": -4,
      \ "AlignAfterOpenBracket": "true",
      \ "BinPackParameters": "false",
      \ "FixNamespaceComments": "true",
      \ "TabWidth": 4}
