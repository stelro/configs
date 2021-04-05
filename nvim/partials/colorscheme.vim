" " Enable true color 
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark
nnoremap <leader>1 :colorscheme jaybeenight<cr>
nnoremap <leader>2 :colorscheme base16-gruvbox-dark-hard<cr>
nnoremap <leader>3 :colorscheme base16-gruvbox-light-soft<cr>
nnoremap <leader>4 :colorscheme xcodedark<cr>
nnoremap <leader>5 :colorscheme xcodelight<cr>

if !has('gui_running')
  set t_Co=256
endif

" Colorscheme settings for Base16 Gruvbox 
let base16colorspace=256
colorscheme base16-gruvbox-dark-hard
"hi Normal ctermbg=NONE
"colorscheme jaybeenight

"colorscheme xcodedark

let g:signify_sign_add    = '┃'
let g:signify_sign_change = '┃'
let g:signify_sign_delete = '•'

let g:signify_sign_show_count = 0 " Don’t show the number of deleted lines.

" Base colors :
" gui0E -> pink / gui08 -> red / gui0A -> yellow
call Base16hi("Comment", g:base16_gui03, "", g:base16_cterm03,  "", "", "")
call Base16hi("Error", g:base16_gui08, g:base16_gui01, g:base16_cterm08, g:base16_cterm01, "none", "")
call Base16hi("VertSplit", g:base16_gui03, g:base16_gui00, g:base16_cterm03, g:base16_cterm00, "none", "")
call Base16hi("CursorLineNr", g:base16_gui06, "", g:base16_cterm06, "", "none", "")
call Base16hi("Todo", g:base16_gui0C, g:base16_gui00, g:base16_cterm0C, g:base16_cterm00, "none", "")
call Base16hi("Type", g:base16_gui0E, "", g:base16_cterm0E, "", "", "")

