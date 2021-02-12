nnoremap <Leader>f :GGFiles<cr>
nnoremap <Leader>. :BTags<cr>
nnoremap <Leader>, :Tags<cr>
nnoremap <Leader>q :CtrlPQuickfix<cr>
nnoremap <Leader>ss :CtrlPObsession<CR>
noremap <Leader>a :Buffers<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>bd :bd <CR>
nnoremap gt :bnext<CR>
nnoremap tg :bprev<CR>
nnoremap <Leader>sc :set spell spelllang=en_us<CR>
nnoremap <Leader>sd :set nospell<CR>

" Disable / Enable line numbers sith <Leader>num
nmap <leader>num :set nu! <CR>:set rnu!<CR>

"save current buffer
nnoremap <leader>w :w<cr>

" Git-fugitive stuff
nmap <leader>g :Gstatus<cr>gg<C-n>

" open header fswitch
nmap <silent> <F4> :FSHere<cr>
nmap <silent> <Leader>of :FSHere<cr>
nmap <silent> <Leader>ol :FSRight<cr>
nmap <silent> <Leader>oL :FSSplitRight<cr>
nmap <silent> <Leader>oh :FSLeft<cr>
nmap <silent> <Leader>oH :FSSplitLeft<cr>
nmap <silent> <Leader>ok :FSAbove<cr>
nmap <silent> <Leader>oK :FSSplitAbove<cr>
nmap <silent> <Leader>oj :FSBelow<cr>
nmap <silent> <Leader>oJ :FSSplitBelow<cr>

" Tagbar
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

 "reload vimrc
:nmap \rv :source $MYVIMRC<CR>

nnoremap <Leader>w/ :vsplit<CR>
nnoremap <Leader>wd :hide<CR>
nnoremap <Leader>wl <C-w><C-w>
"nerdtree
nnoremap <Leader>pt :NERDTreeToggle<CR>

"strip whitespace
nnoremap <leader>sw :%s/\s\+$//<cr>:let @/=''<CR>
command! Stripwhitespace :%s/\s\+$//
command! Whitespacestrip :%s/\s\+$//

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" duplicate lanes TODO
nmap <leader>dd :s/\(^.*$\)/\1\r\1/<CR>:noh<CR>
xmap <leader>dd :'<,'>s/\(.*\)/\1\r\1/<CR>:noh<CR>
