"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" Rostislav Stelmach's .vimrc config file
" for C/C++ Development
"
" Last Update: 14/12/2020
" stelmach.ro[at]gmail.com
"
set nocompatible              " be iMproved, required
filetype off                  " required

" ----------------------------------------------------------------------------
" PLUGINS
" ----------------------------------------------------------------------------

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"Keep Plugin commands between vundle#begin/end.
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdTree'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'kana/vim-operator-user'
Plugin 'tikhomirov/vim-glsl'
Plugin 'danro/rename.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown' 
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'rhysd/vim-clang-format'
Plugin 'sbdchd/neoformat'
" session management
Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'
Plugin 'gikmx/ctrlp-obsession'
" fast searching
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'majutsushi/tagbar'
Plugin 'joereynolds/gtags-scope'
" :Search :SearchBuffers :SearchReset :SearchBuffersReset
Plugin 'vim-scripts/MultipleSearch'
Plugin 'vim-scripts/visual-increment'
Plugin 'Valloric/YouCompleteMe'
Plugin 'wakatime/vim-wakatime'
" Rust
Plugin 'rust-lang/rust.vim'

let g:colorizer_startup = 0

call vundle#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
filetype plugin on

" ----------------------------------------------------------------------------
" GENERAL SETTINGS 
" ----------------------------------------------------------------------------

syntax on
let mapleader = " "         " Set leader key to comma
set number                  " Show line numbers
set relativenumber          " Show relative numbers
set wrap                    " Enable wraping
set linebreak               " Break lines at word (requires Wrap lines)
set nolist                  " List disables linebreak
set scrolloff=5             " 5 lines above/below cursor when scrolling
set noswapfile              " Turn off swapfiles
set wrapmargin=0            " Disable line wrap
set ruler                   " Show row and column ruler information
set showbreak=+++           " Wrap-broken line prefix (shows +++)
set showmatch               " Highlight matching brace
set showcmd                 " Show command in bottom bar
set title                   " Show file in titlebar
set showmode                " Show mode in status bar (insert/replace/...)
set cursorline              " Highlight current line
set hlsearch                " Highlight all search results
set smartcase               " Enable smart-case search
set ignorecase              " Always case-insensitive
set incsearch               " Searches for strings incrementally
set virtualedit=onemore     " allow to go one character behind the end of the line
set autoindent              " Auto-indent new lines
set expandtab               " Use spaces instead of tabs (Spaces are always 1 width in every OS)
set shiftwidth=4            " Number of auto-indent spaces
set smartindent             " Enable smart-indent
set smarttab                " Enable smart-tabs
set softtabstop=4           " Number of spaces per Tab
set wildmenu                " Visual autocomplete for command menu
set lazyredraw              " Redraw only when we need to.
set confirm                 " Get a dialog when :q, :w, or :wq fails
set nobackup                " No backup~ files.
set textwidth=100           " 100 is the new 80
set hidden                  " Remember undo after quitting
set history=200             " Keep 200 lines of command history
set mouse=v                 " Use mouse in visual mode (not normal,insert,command,help mode)
set previewheight=7
" display whitespace
set listchars=tab:>-,trail:~,extends:>,precedes:<
"set listchars=eol: ,tab:>-,trail:~,extends:>,precedes:<
set tags=./tags;/   "This will look in the current directory for 'tags', and work up the tree towards root until one is found.
set cscopetag

set wildignore+=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn,*/cm/log/**,tags,*.jpg,*.png,*.jpeg,*.png,*.mesh,build*/**,build/**,*.sublime-workspace,*.svg,build2/**,build3/**


command! Ctagsgenerate :!ctags -R .
command! Gtagsgenerate :!gtags

let g:gitgutter_max_signs=9999

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

" ----------------------------------------------------------------------------
" SEARCHING
" ----------------------------------------------------------------------------
" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~30%' }
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

command! GGFiles call fzf#run(fzf#wrap({'source': 'if [ -d .git ] ; then git ls-files -co --exclude-standard ; elif [ -d .hg ] ; then hg locate ; else  find . ; fi', 'sink': 'e'}))

" ----------------------------------------------------------------------------
" KEY BINDING
" ----------------------------------------------------------------------------
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

" " Enable true color 
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"

set background=dark
nnoremap <leader>1 :colorscheme jaybeenight<cr>:AirlineTheme jaybee<cr>
nnoremap <leader>2 :colorscheme base16-gruvbox-dark-hard<cr>
nnoremap <leader>3 :colorscheme base16-gruvbox-light-soft<cr>

" Colorscheme settings for Base16 Gruvbox 
let base16colorspace=256
colorscheme base16-gruvbox-dark-hard
hi Normal ctermbg=NONE

if !has('gui_running')
  set t_Co=256
endif

" Base colors :
" gui0E -> pink / gui08 -> red / gui0A -> yellow
call Base16hi("Comment", g:base16_gui03, "", g:base16_cterm03,  "", "", "")
call Base16hi("Error", g:base16_gui08, g:base16_gui01, g:base16_cterm08, g:base16_cterm01, "none", "")
call Base16hi("VertSplit", g:base16_gui03, g:base16_gui00, g:base16_cterm03, g:base16_cterm00, "none", "")
call Base16hi("CursorLineNr", g:base16_gui06, "", g:base16_cterm06, "", "none", "")
call Base16hi("Todo", g:base16_gui0C, g:base16_gui00, g:base16_cterm0C, g:base16_cterm00, "none", "")
call Base16hi("Type", g:base16_gui0E, "", g:base16_cterm0E, "", "", "")

" ----------------------------------------------------------------------------
"
" C++ Stuff
" ----------------------------------------------------------------------------
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
      \ "SpacesInParentheses": "true",
      \ "SpacesInSquareBrackets": "true",
      \ "AlignTrailingComments": "true",
      \ "AccessModifierOffset": -4,
      \ "TabWidth": 4}

augroup ClangFormatSettings
    autocmd!
    " if you install vim-operator-user
    autocmd FileType c,cpp,cc,objc,java,javascript,glsl map <buffer><Leader>c <Plug>(operator-clang-format)
    autocmd FileType cpp,cc syntax clear cppSTLconstant
augroup END

" Neoformat
let g:neoformat_enabled_python = ['autopep8']

nnoremap <Leader>cf :ClangFormat<CR>
vnoremap <Leader>cf :ClangFormat<CR>
" format line +-1
autocmd FileType c,cpp,objc,java,javascript nnoremap <Leader>cc :.-1,.+1Neoformat<CR>

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

noremap <Leader>s :update<CR>
"switch between header/source with Ctr+2
map <C-2> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,.hh,.cc,:s,.X123X$,.cpp,<CR>

set pastetoggle=<F2>

"let g:syntastic_cpp_compiler_options = "-std=c++17"
"   YCM
" http://stackoverflow.com/questions/3105307/how-do-you-automatically-remove-the-preview-window-after-autocompletion-in-vim
" :h ins-completion.
" :YcmDiags - errors
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" turn off completion in comments
let g:ycm_complete_in_comments=0
" load ycm conf by default
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" turn on tag completion
let g:ycm_collect_identifiers_from_tags_files=1
" only show completion as a list instead of a sub-window
set completeopt-=preview
" start completion from the first character
let g:ycm_min_num_of_chars_for_completion=4
" don't cache completion items
let g:ycm_cache_omnifunc=0
" complete syntax keywords
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_max_num_candidates = 10

let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>>'
let g:ycm_max_diagnostics_to_display = 0
let g:ycm_enable_diagnostic_signs=1
let g:ycm_show_diagnostics_ui =1
highlight YcmErrorSection guibg=#17191A
highlight YcmWarningSection guibg=#17191A

nnoremap <Leader>yj :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <Leader>yg :YcmCompleter GoTo<CR>
nnoremap <Leader>yi :YcmCompleter GoToImplementationElseDeclaration<CR>
nnoremap <Leader>yt :YcmCompleter GetTypeImprecise<CR>
nnoremap <Leader>yd :YcmCompleter GetDoc<CR>
nnoremap <Leader>yf :YcmCompleter FixIt<CR>
nnoremap <Leader>yr :YcmCompleter GoToReferences<CR>
nnoremap <Leader>el :YcmDiags<CR>
nnoremap <Leader>yD ::YcmForceCompileAndDiagnostics<CR>
nnoremap <Leader>yR :YcmRestartServer<CR>
nnoremap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F10> :YcmCompleter GetTypeImprecise<CR>
nnoremap <F9> :YcmCompleter GetDocImprecise<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"----------------------------------------------------------------------------
" general stuff
" ----------------------------------------------------------------------------
" check file change every 4 seconds ('CursorHold') and reload the buffer upon
" detecting change
set autoread
au CursorHold * checktime

:nmap <F1> <nop>

"Advanced
set undolevels=1000 "Number of undo levels
set backspace=indent,eol,start  "Backspace behaviour

augroup filetypedetect
    au BufRead,BufNewFile *.log set filetype=log
    au BufReadPost,BufNewFile *.compositor set ft=compositor
    au BufReadPost,BufNewFile *.material set ft=material
    au BufReadPost,BufNewFile *.glsl,*.cg set ft=glsl
    au BufReadPost,BufNewFile database.txt,*.conf set ft=conf
    au BufReadPost,BufNewFile config.in set ft=kconfig
    au BufReadPost,BufNewFile *.xml set tabstop=4
    au BufReadPost,BufNewFile *.crt set ft=crt
augroup END

"save with root
command! Wroot :execute ':silent w !sudo tee % > /dev/null' | :edit!

" airline
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }
let g:airline#extensions#default#section_truncate_width = {
  \ 'b': 79,
  \ 'x': 60,
  \ 'y': 88,
  \ 'z': 60,
  \ 'warning': 80,
  \ 'error': 80,
  \ }
let w:airline_skip_empty_sections = 1
" let g:airline_section_b=' %{fugitive#head()}'
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#wordcount#enabled = 1
let g:airline_section_z='%l:%c'
let g:airline#extensions#branch#format = 2
set laststatus=2

let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 0

let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
" -----------------------------------------------------------------------------
" Make the dot command work as expected in visual mode (via
" https://www.reddit.com/r/vim/comments/3y2mgt/do_you_have_any_minor_customizationsmappings_that/cya0x04)
vnoremap . :norm.<CR>

" -----------------------------------------------------------------------------
" Save temporary/backup files not in the local directory, but in your ~/.vim
" directory, to keep them out of git repos.
" But first mkdir backup, swap, and undo first to make this work
call system('mkdir ~/.vim')
call system('mkdir ~/.vim/backup')
call system('mkdir ~/.vim/swap')
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    call system('mkdir ~/.vim/undo')
    set undodir=~/.vim/undo//
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

" -----------------------------------------------------------------------------
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
