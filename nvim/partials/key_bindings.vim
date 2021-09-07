" Search in project tree (as in CLion file)
nnoremap <Leader>p :Files<cr>
" Search in project directory
nnoremap <Leader>g :GGFiles<cr>
nnoremap <Leader>. :BTags<cr>
" Show tags
nnoremap <Leader>, :Tags<cr>
nnoremap <Leader>q :CtrlPQuickfix<cr>
nnoremap <Leader>ss :CtrlPObsession<CR>
" Show buffers
noremap <Leader>a :Buffers<CR>
" Show buffers
nnoremap <Leader>bb :Buffers<CR>
" Close current buffer
nnoremap <Leader>bd :bd <CR>
" Next buffer
nnoremap gt :bnext<CR>
" Previous buffer
nnoremap tg :bprev<CR>
" Enable spell-checker
nnoremap <Leader>sc :set spell spelllang=en_us<CR>
" Disable spell-checker
nnoremap <Leader>sd :set nospell<CR>
" Regex search in project (this is the best command)
nnoremap <Leader>f :Rg!
" Disable / Enable line numbers with <Leader>num
nmap <leader>num :set nu! <CR>:set rnu!<CR>

" C++ Jump to definition
nmap <silent> zd <Plug>(coc-definition)
nmap <silent> zy <Plug>(coc-type-definition)
" C++ Jump to Implementation
nmap <silent> zi <Plug>(coc-implementation)
" C++ Show references
nmap <silent> zr <Plug>(coc-references)

"save current buffer
nnoremap <leader>w :w<cr>

" Git-fugitive stuff
nmap <leader>s :Gstatus<cr>gg<C-n>

" open header file
nmap <silent> <F4> :FSHere<cr>
" Switch between header file and source file (C++)
nmap <silent> <Leader>of :FSHere<cr>
nmap <silent> <Leader>ol :FSRight<cr>
nmap <silent> <Leader>oL :FSSplitRight<cr>
nmap <silent> <Leader>oh :FSLeft<cr>
nmap <silent> <Leader>oH :FSSplitLeft<cr>
nmap <silent> <Leader>ok :FSAbove<cr>
nmap <silent> <Leader>oK :FSSplitAbove<cr>
nmap <silent> <Leader>oj :FSBelow<cr>
nmap <silent> <Leader>oJ :FSSplitBelow<cr>

" Show Tagbar with current file tags
nmap <silent> <Leader>t :TagbarToggle<CR>
nmap <silent> <Leader>tb :TagbarOpenAutoClose<CR>
let g:tagbar_case_insensitive = 1
" let g:tagbar_compact = 1
let g:tagbar_indent = 1
let g:tagbar_map_showproto = "r"
let g:tagbar_map_togglefold = "<space>"
let g:tagbar_sort = 0

" increment numbers
noremap + <c-a>
noremap - <c-x>

set splitbelow    " more natural split opening
set splitright    " more natural split opening

" reload neovim configuration
:nmap \rv :source $MYVIMRC<CR>

" Split window vertically and make a new pane
nnoremap <Leader>w/ :vsplit<CR>
" Close/Hide pane
nnoremap <Leader>wd :hide<CR>
" Show diagnostic pane (with errors/warnings)
nnoremap <Leader>wl <C-w><C-w>
" Show project tree with files/directories
nnoremap <Leader>pt :NERDTreeToggle<CR>

" strip whitespaces
nnoremap <leader>sw :%s/\s\+$//<cr>:let @/=''<CR>
command! Stripwhitespace :%s/\s\+$//
command! Whitespacestrip :%s/\s\+$//

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Duplicate lines 
nmap <leader>dd :s/\(^.*$\)/\1\r\1/<CR>:noh<CR>
xmap <leader>dd :'<,'>s/\(.*\)/\1\r\1/<CR>:noh<CR>

" Clang format
let g:neoformat_enabled_python = ['autopep8']

nnoremap <Leader>cf :ClangFormat<CR>
vnoremap <Leader>cf :ClangFormat<CR>
" format line +-1
autocmd FileType c,cpp,objc,java,javascript,rust nnoremap <Leader>cc :.-1,.+1Neoformat<CR>
