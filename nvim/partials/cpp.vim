command! Ctagsgenerate :!ctags -R .
command! Gtagsgenerate :!gtags

" Compile and run single source file without leaving neovim
" Use F1 as a key binding (we have dissabled the F1 for Help in keybindings.vim file)
autocmd filetype cpp nnoremap <F1> :w <bar> exec '!clang++ -std=c++20 -Wall -Wextra -g -pthread -latomic '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<cr>
autocmd filetype c nnoremap <F1> :w <bar> exec '!clang  -Wall -Wextra -g -O0 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<cr>
autocmd filetype ruby nnoremap <F1> :w <bar> exec '!ruby '.shellescape('%')<CR>
autocmd filetype javascript nnoremap <F1> :w <bar> exec '!/usr/bin/node '.shellescape('%')<CR>
autocmd filetype lua nnoremap <F1> :w <bar> exec '!/usr/bin/lua5.3 '.shellescape('%')<CR>
autocmd filetype jsx nnoremap <F1> :w <bar> exec '!/usr/bin/node '.shellescape('%')<CR>
autocmd filetype javascript.jsx nnoremap <F8> :w <bar> exec '!/usr/bin/node '.shellescape('%')<CR>
autocmd filetype pl nnoremap <F1> :w <bar> exec '!perl '.shellescape('%')<CR>
autocmd filetype python nnoremap <F1> :w <bar> exec '!python3 '.shellescape('%')<CR>
autocmd filetype rust nnoremap <F1> :w <bar> exec '!rustc '.shellescape('%')<CR>

" C++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Clang format - my personal settings
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
      \ "SpaceBeforeParens": "Never",
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

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Show cppman 
" TODO: This is broken right. We need to fix it
function! JbzCppMan()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute 'Man ' . str
endfunction

command! JbzCppMan :call s:JbzCppMan()

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    call JbzCppMan()
  elseif (coc#rpc#ready())
    " call JbzCppMan()
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
