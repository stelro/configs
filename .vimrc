"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" Stel's .vimrc file
"
" Last Update: 08/06/2019
" stelmach.ro[at]gmail.com
"
set nocompatible              " be iMproved, required
filetype off                  " required

" ----------------------------------------------------------------------------
" PLUGINS
" ----------------------------------------------------------------------------

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomtom/tcomment_vim'
"Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'
" :GV - commit browser
" :GV! only commits for current file
"  o or <cr> on a commit to display the content of it
"  o or <cr> on commits to display the diff in the range
"  O opens a new tab instead
"  gb for :Gbrowse
"  ]] and [[ to move between commits
"  . to start command-line with :Git [CURSOR] SHA à la fugitive
"  q to close
Plugin 'junegunn/gv.vim'
" Sourdings, parantheses, brackes, quotes, XML Tags 
" with cs"' to change from "" to ''
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdTree'
Plugin 'vim-scripts/argtextobj.vim'
" User defined operators/actions
Plugin 'kana/vim-operator-user'
Plugin 'vimwiki/vimwiki'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'christoomey/vim-sort-motion'
Plugin 'tikhomirov/vim-glsl'
Plugin 'danro/rename.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown' 
" better cooperation with tmux
Plugin 'christoomey/vim-tmux-navigator'
" gutter for marks
Plugin 'kshenoy/vim-signature'
" Vim plug for switching between companion source files (e.g. .h and .cpp)
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
" Snippets
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
"Plugin 'kracejic/snippetinabox.vim'
"Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'joereynolds/gtags-scope'
" :Search :SearchBuffers :SearchReset :SearchBuffersReset
Plugin 'vim-scripts/MultipleSearch'
Plugin 'vim-scripts/visual-increment'
Plugin 'Valloric/YouCompleteMe'
Plugin 'wakatime/vim-wakatime'
"Themes
"Plugin 'w0rp/ale'

let g:colorizer_startup = 0

call vundle#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
filetype plugin on

" ----------------------------------------------------------------------------
" GENERAL SETTINGS 
" ----------------------------------------------------------------------------

syntax on
let mapleader = " "         "set leader key to comma
"set number  "Show line numbers
"set relativenumber

nmap <leader>num :set nu! <CR>:set rnu!<CR>
set wrap  "enable wraping
set linebreak   "Break lines at word (requires Wrap lines)
set nolist         " list disables linebreak
set scrolloff=5         " 2 lines above/below cursor when scrolling
set noswapfile  " turn off swapfiles
set wrapmargin=0  "Disable line wrap
set ruler   "Show row and column ruler information
set showbreak=+++   "Wrap-broken line prefix
set showmatch   "Highlight matching brace
set showcmd             " show command in bottom bar
set title               " show file in titlebar
set showmode            " show mode in status bar (insert/replace/...)
"set visualbell  "Use visual bell (no beeping)
set cursorline          " highlight current line
set matchpairs+=<:>     " specially for html
set hlsearch    "Highlight all search results
set smartcase   "Enable smart-case search
set ignorecase  "Always case-insensitive
set incsearch   "Searches for strings incrementally
set virtualedit=onemore  "allow to go one character behind the end of the line
set autoindent  "Auto-indent new lines
set expandtab   "Use spaces instead of tabs
set shiftwidth=2    "Number of auto-indent spaces
set smartindent "Enable smart-indent
set smarttab    "Enable smart-tabs
set softtabstop=2   "Number of spaces per Tab
set wildmenu            " visual autocomplete for command menu
set wildignore+=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn,*/cm/log/**,tags,*.jpg,*.png,*.jpeg,*.png,*.mesh,build*/**,build/**,*.sublime-workspace,*.svg,build2/**,build3/**
set lazyredraw          " redraw only when we need to.
set confirm             " get a dialog when :q, :w, or :wq fails
set nobackup            " no backup~ files.
set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set textwidth=100           " 100 is the new 80
set hidden              " remember undo after quitting
set history=150          " keep 150 lines of command history
set mouse=v             " use mouse in visual mode (not normal,insert,command,help mode
set t_ut=
set previewheight=7
" display whitespace
set listchars=tab:>-,trail:~,extends:>,precedes:<
"set listchars=eol: ,tab:>-,trail:~,extends:>,precedes:<

set tags=./tags;/   "This will look in the current directory for 'tags', and work up the tree towards root until one is found.
set cscopetag

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
" nnoremap <C-p> :CtrlP<cr>
nnoremap <Leader>. :BTags<cr>
nnoremap <Leader>, :Tags<cr>
nnoremap <Leader>q :CtrlPQuickfix<cr>
nnoremap <Leader>ss :CtrlPObsession<CR>
noremap <Leader>a :Buffers<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>bd :bd <CR>
nnoremap gt :bnext<CR>
nnoremap tg :bprev<CR>


"save current buffer
nnoremap <leader>w :w<cr>

"set line numbers
nnoremap <Leader>ts :set invnumber<CR>

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

" vimwiki
command! WTable :VimwikiTable
command! WToc :VimwikiTOC
command! WTags :VimwikiRebuildTags

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

" ----------------------------------------------------------------------------
" THEMES STUFF
" ----------------------------------------------------------------------------
" let g:dracula_colorterm = 0 
" let g:space_vim_dark_background = 234
" hi LineNr ctermbg=NONE guibg=NONE
"
" " Enable true color 
" if exists('+termguicolors')
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"   set termguicolors
" endif

set background=dark
nnoremap <leader>1 :colorscheme themeinabox<cr>:AirlineTheme base16_eighties<cr>
nnoremap <leader>2 :colorscheme badwolf<cr>:AirlineTheme badwolf<cr>
nnoremap <leader>3 :colorscheme themeinabox-transparent<cr>:AirlineTheme base16_eighties<cr>


colorscheme themeinabox
"colorscheme railscasts
let g:airline_theme='base16_eighties'

" ----------------------------------------------------------------------------
" C++ Stuff
" ----------------------------------------------------------------------------
" CLANG FORMAT
" default settings
let g:clang_format#code_style = "llvm"
let g:clang_format#style_options = {
      \ "AllowShortFunctionsOnASingleLine": "Empty",
      \ "AlwaysBreakTemplateDeclarations": "true",
      \ "BreakBeforeBraces": "Custom",
      \ "BreakConstructorInitializersBeforeComma": "true",
      \ "IndentCaseLabels": "true",
      \ "IndentWidth":     2,
      \ "MaxEmptyLinesToKeep": 2,
      \ "NamespaceIndentation": "All",
      \ "BraceWrapping": {
      \   "AfterEnum": "true",
      \   "AfterStruct": "false",
      \   "AfterControlStatement": "false",
      \   "AfterFunction": "false",
      \   "AfterNamespace": "false",
      \   "BeforeElse": "false"},
      \ "ObjCBlockIndentWidth": 2,
      \ "SpaceBeforeCpp11BracedList": "true",
      \ "SpaceBeforeRangeBasedForLoopColon": "true",
      \ "SpacesBeforeTrailingComments": 4,
      \ "SpacesInCStyleCastParentheses": "true",
      \ "SpacesInContainerLiterals": "true",
      \ "SpacesInParentheses": "true",
      \ "SpacesInSquareBrackets": "true",
      \ "AlignTrailingComments": "true",
      \ "TabWidth": 2}

augroup ClangFormatSettings
    autocmd!
    " if you install vim-operator-user
    autocmd FileType c,cpp,cc,objc,java,javascript,glsl map <buffer><Leader>c <Plug>(operator-clang-format)
    autocmd FileType c,cpp,cc syntax clear cppSTLconstant
    autocmd FileType vimwiki nmap <leader>tts :TaskWikiMod +sprint<CR>
    autocmd FileType vimwiki nmap <leader>ttS :TaskWikiMod -sprint<CR>
augroup END

" Neoformat
let g:neoformat_enabled_python = ['autopep8']

nnoremap <Leader>cf :ClangFormat<CR>
vnoremap <Leader>cf :ClangFormat<CR>
" format line +-1
autocmd FileType c,cpp,objc,java,javascript nnoremap <Leader>cc :.-1,.+1Neoformat<CR>

"compile and run single source file without leaving vim
autocmd filetype cpp nnoremap <f8> :w <bar> exec '!g++ -std=c++17 -Wall -Wextra -g '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<cr>
autocmd filetype c nnoremap <f8> :w <bar> exec '!gcc  -Wall -Wextra -g '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<cr>
autocmd filetype ruby nnoremap <F8> :w <bar> exec '!ruby '.shellescape('%')<CR>
autocmd filetype javascript nnoremap <F8> :w <bar> exec '!/usr/bin/node '.shellescape('%')<CR>
autocmd filetype lua nnoremap <F8> :w <bar> exec '!/usr/bin/lua5.3 '.shellescape('%')<CR>
autocmd filetype jsx nnoremap <F8> :w <bar> exec '!/usr/bin/node '.shellescape('%')<CR>
autocmd filetype javascript.jsx nnoremap <F8> :w <bar> exec '!/usr/bin/node '.shellescape('%')<CR>

"auto C/C++ header files guards
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp,hh} call <SID>insert_gates()
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
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger=1
let g:ycm_min_num_of_chars_for_completion=6
let g:ycm_max_num_candidates = 10
let g:ycm_semantic_triggers = {
      \'c' : ['->', '    ', '.', ' ', '(', '[', '&'],
      \'cpp,objcpp' : ['->', '.', ' ', '(', '[', '&', '::'],
      \'perl' : ['->', '::', ' '],
      \'php' : ['->', '::', '.'],
      \'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
      \'ruby' : ['.', '::'],
      \'lua' : ['.', ':'],
      \'scss,css': [ 're!^\s{2,4}', 're!:\s+' ],
      \'html': ['<', '"', '</', ' '],
      \'javascript': ['.', 're!(?=[a-zA-Z]{3,4})'],
      \}
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_error_symbol = '●'
let g:ycm_warning_symbol = '.'
let g:ycm_enable_diagnostic_signs=0
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

"Advanced
set undolevels=1000 "Number of undo levels
set backspace=indent,eol,start  "Backspace behaviour

augroup filetypedetect
    au BufRead,BufNewFile *.log set filetype=log
    au BufReadPost,BufNewFile *.compositor set ft=compositor
    au BufReadPost,BufNewFile *.material set ft=material
    au BufReadPost,BufNewFile *.glsl,*.cg set ft=glsl
    au BufReadPost,BufNewFile content.txt set ft=fitnesse
    au BufReadPost,BufNewFile database.txt,*.conf set ft=conf
    au BufReadPost,BufNewFile config.in set ft=kconfig
    au BufReadPost,BufNewFile *.xml set tabstop=4
    au BufReadPost,BufNewFile *.crt set ft=crt
augroup END

"folding

" set foldenable          " enable folding
" set foldlevelstart=10   " open most folds by default
" set foldnestmax=10      " 10 nested fold max
" nnoremap <space> za
" nnoremap z<space> zA
" set foldmethod=indent   " fold based on indent level
"
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
let g:airline#extensions#wordcount#enabled = 0
let g:airline_section_z='☰ %l/%L:%c'
let g:airline#extensions#branch#format = 2
set laststatus=2

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

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

" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" nmap <Leader>w <Plug>(easymotion-w)

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap ss <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

"ale config
let g:ale_sign_error = '●' "Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 "Less dsitracting when opening new file

" markdown ctags
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'vimwiki',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }
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

" ----------------------------------------------------------------------------
" Building Projects
" ----------------------------------------------------------------------------

" CMake support
function! BuildCMakeProjectShort(target, dir)
    echom a:target
    if isdirectory(a:dir)
        silent !clear
        execute "! cd " . a:dir . " && clear && cmake --build . --target " . a:target . " -- -j" . (system('grep -c ^processor /proc/cpuinfo')+1) . " && echo '-- Build was OK'"
    else
        echo "build folder was not found, cannot build"
    endif
endfunction

function! BuildCMakeProject(target, dir)
    echom a:target
    if isdirectory(a:dir)
        let result = system( "cd " . a:dir . " && clear && cmake --build . --target " . a:target . " -- -j" . (system('grep -c ^processor /proc/cpuinfo')+1) . " 2>&1 && echo '-- Build was OK'")

        split __Build_output__
        normal! ggdG
        setlocal filetype=krcppbuild
        setlocal buftype=nofile
        setlocal bufhidden=hide
        setlocal nobuflisted

        " Insert the bytecode.
        call append(0, split(result, '\v\n'))
        setlocal nonumber
        setlocal norelativenumber
        " setlocal nomodifiable

        :map <buffer> q :bd<cr>
    else
        echo "build folder was not found, cannot build"
    endif
endfunction

nmap <leader>bt :!tmux send-keys -t "build" Up Enter<CR><CR>

if isdirectory("build")
    nmap <leader>ba :call BuildCMakeProject("all", "build")<CR>
    nmap <leader>bt :call BuildCMakeProject("catch", "build")<CR>
    nmap <leader>be :call BuildCMakeProject("main.x", "build")<CR>
    nmap <leader>br :call BuildCMakeProjectShort("run", "build")<CR>
    nmap <leader>bc :call BuildCMakeProjectShort("clean", "build")<CR>
    nmap <leader>bf :call BuildCMakeProjectShort("format", "build")<CR>
endif

