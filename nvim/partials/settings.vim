let mapleader = " "

set title                                                                       "change the terminal's title
set number                                                                      "Line numbers are good
set noshowmode                                                                  "Hide showmode because of the powerline plugin
set gdefault                                                                    "Set global flag for search and replace
set cursorline                                                                  "Highlight current line
set smartcase                                                                   "Smart case search if there is uppercase
set ignorecase                                                                  "case insensitive search
set mouse=a                                                                     "Enable mouse usage
set showmatch                                                                   "Highlight matching bracket
set timeoutlen=1000 ttimeoutlen=0                                               "Reduce Command timeout for faster escape and O
set fileencoding=utf-8                                                          "Set utf-8 encoding on write
set exrc                                                                        "Allow using local vimrc
set undofile                                                                    "Keep undo history across sessions, by storing in file
set noswapfile                                                                  "Disable creating swap file
set nobackup                                                                    "Disable saving backup file
set nowritebackup                                                               "Disable writing backup file
set diffopt+=vertical                                                           "Always use vertical layout for diffs
set wrap                                                                        " Enable wraping
set linebreak                                                                   " Break lines at word (requires Wrap lines)
set nolist                                                                      " List disables linebreak
set scrolloff=5                                                                 " 5 lines above/below cursor when scrolling
set wrapmargin=0                                                                " Disable line wrap
set ruler                                                                       " Show row and column ruler information
set showbreak=+++                                                               " Wrap-broken line prefix (shows +++)
set showcmd                                                                     " Show command in bottom bar
set showmode                                                                    " Show mode in status bar (insert/replace/...)
set hlsearch                                                                    " Highlight all search results
set virtualedit=onemore                                                         " allow to go one character behind the end of the line
set autoindent                                                                  " Auto-indent new lines
set expandtab                                                                   " Use spaces instead of tabs (Spaces are always 1 width in every OS)
set shiftwidth=4                                                                " Number of auto-indent spaces
set smartindent                                                                 " Enable smart-indent
set smarttab                                                                    " Enable smart-tabs
set softtabstop=4                                                               " Number of spaces per Tab
set wildmenu                                                                    " Visual autocomplete for command menu
set lazyredraw                                                                  " Redraw only when we need to.
set confirm                                                                     " Get a dialog when :q, :w, or :wq fails
set textwidth=100                                                               " 100 is the new 80
set hidden                                                                      " Remember undo after quitting
set history=200                                                                 " Keep 200 lines of command history
set mouse=v                                                                     " Use mouse in visual mode (not normal,insert,command,help mode)
set previewheight=7
set listchars=tab:>-,trail:~,extends:>,precedes:<
"set listchars=eol: ,tab:>-,trail:~,extends:>,precedes:<
set tags=./tags;/                                                               "This will look in the current directory for 'tags', and work up the tree towards root until one is found.
set cscopetag

set wildignore+=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn,*/cm/log/**,tags,*.jpg,*.png,*.jpeg,*.png,*.mesh,build*/**,build/**,*.sublime-workspace,*.svg,build2/**,build3/**

" support glsl syntax highlighting
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

" ----------------------------------------------------------------------------
" ABBREVATIONS
" ----------------------------------------------------------------------------
" I can't spell :(
abbr conosle console
abbr comopnent component
abbr inlcude include
abbr cosnt const

" These are things that I mistype and want ignored.
nmap Q  <silent>
nmap q: <silent>
nmap K  <silent>

" I always hit ":W" instead of ":w" because I linger on the shift key...
command! Q q
command! W w
command! Wq wq

let g:sessions_dir = '~/vim-sessions'

set pastetoggle=<F2>

let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" -----------------------------------------------------------------------------
" Save temporary/backup files not in the local directory, but in your ~/.config/nvim
" directory, to keep them out of git repos.
" But first mkdir backup, swap, and undo first to make this work
call system('mkdir ~/.config/nvim')
call system('mkdir ~/.config/nvim/backup')
call system('mkdir ~/.config/nvim/swap')
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    call system('mkdir ~/.config/nvim/undo')
    set undodir=~/.config/nvim/undo//
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" swap lines 
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

nmap  <Leader>kk :call <SID>swap_up()<CR>
nmap  <Leader>jj :call <SID>swap_down()<CR>

" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Need one more keystroke, but on average, it may be more comfortable.
nmap ss <Plug>(easymotion-s2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

" -----------------------------------------------------------------------------
" search for visually selected text
vnoremap // y/<C-R>"<CR>

augroup ClangFormatSettings
    autocmd!
    " if you install vim-operator-user
    autocmd FileType c,cpp,cc,objc,java,javascript,glsl,rust map <buffer><Leader>c <Plug>(operator-clang-format)
    autocmd FileType cpp,cc syntax clear cppSTLconstant
augroup END
