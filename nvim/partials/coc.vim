" Auto-completion settings
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Using CocList
" Show all diagnostics
nnoremap <silent> el  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> ye  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> yc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> yo  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> ys  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> yj  :<C-u>CocNext<CR>

" Do default action for previous item.
nnoremap <silent> yk  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> yp  :<C-u>CocListResume<CR>

let g:coc_user_config = {
      \ 'prettier.printWidth': 100,
      \ 'sql.database': 'postgresql',
      \ 'diagnostic.errorSign': '✖',
      \ 'diagnostic.infoSign': '🛈',
      \ 'diagnostic.hintSign': '🛈',
      \ 'list.maxPreviewHeight': 4,
      \ 'coc.preferences.currentFunctionSymbolAutoUpdate': v:true,
      \ }
