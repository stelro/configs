 "        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" Stel's .vimrc file
"
" Last Update: 20/10/2017
" stelmach.ro[at]gmail.com
"

" ----------------------------------------------------------------------------
" KEY MAPS
" ----------------------------------------------------------------------------

" set leader key to comma
let mapleader = ","

"NERDTree key mapping
map <C-z> :NERDTreeToggle<CR>

" You don't know what you're missing if you don't use this.
nmap <C-e> :e#<CR>

" unmap F1 help
nmap <F1> <nop>
imap <F1> <nop>

" Move between open buffers.
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" These are things that I mistype and want ignored.
nmap Q  <silent>
nmap q: <silent>
nmap K  <silent>

set encoding=utf-8
set nocompatible
filetype off

" ----------------------------------------------------------------------------
" PLUGINS
" ----------------------------------------------------------------------------

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'haya14busa/incsearch.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'honza/vim-snippets'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'othree/html5-syntax.vim'
Plugin 'tpope/vim-endwise'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'jalcine/cmake.vim'
Plugin 'mattn/emmet-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'mxw/vim-jsx'
Plugin 'alvan/vim-closetag'
Plugin 'mileszs/ack.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/goyo.vim'


call vundle#end()
filetype plugin indent on

" ----------------------------------------------------------------------------
" OPTIONS
" ----------------------------------------------------------------------------

set autoindent              " Carry over indenting from previous line
set autoread                " Don't bother me hen a file changes
set autowrite               " Write on :next/:prev/^Z
set backspace=indent,eol,start
                            " Allow backspace beyond insertion point
set cindent                 " Automatic program indenting
set cinkeys-=0#             " Comments don't fiddle with indenting
set cino=                   " See :h cinoptions-values
set commentstring=\ \ #%s   " When folds are created, add them to this
set copyindent              " Make autoindent use the same chars as prev line
set directory-=.            " Don't store temp files in cwd
set encoding=utf8           " UTF-8 by default
set expandtab               " No tabs
set fileformats=unix,dos,mac  " Prefer Unix
set fillchars=vert:\ ,stl:\ ,stlnc:\ ,fold:-,diff:┄
                            " Unicode chars for diffs/folds, and rely on
                            " Colors for window borders
silent! set foldmethod=marker " Use braces by default
set formatoptions=tcqn1     " t - autowrap normal text
                            " c - autowrap comments
                            " q - gq formats comments
                            " n - autowrap lists
                            " 1 - break _before_ single-letter words
                            " 2 - use indenting from 2nd line of para
set hidden                  " Don't prompt to save hidden windows until exit
set history=200             " How many lines of history to save
set hlsearch                " Hilight searching
set ignorecase              " Case insensitive
set incsearch               " Search as you type
set infercase               " Completion recognizes capitalization
set laststatus=2            " Always show the status bar
set linebreak               " Break long lines by word, not char
"set list                    " Show whitespace as special chars - see listchars
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:· " Unicode characters for various things
set matchtime=2             " Tenths of second to hilight matching paren
set modelines=5             " How many lines of head & tail to look for ml's
silent! set mouse=nvc       " Use the mouse, but not in insert mode
set nobackup                " No backups left after done editing
"set nonumber                " No line numbers to start
set visualbell t_vb=        " No flashing or beeping at all
set nowritebackup           " No backups made while editing
set printoptions=paper:letter " US paper
set ruler                   " Show row/col and percentage
set scroll=4                " Number of lines to scroll with ^U/^D
set scrolloff=15            " Keep cursor away from this many chars top/bot
set sessionoptions-=options " Don't save runtimepath in Vim session (see tpope/vim-pathogen docs)
set shiftround              " Shift to certain columns, not just n spaces
set shiftwidth=4            " Number of spaces to shift for autoindent or >,<
set shortmess+=A            " Don't bother me when a swapfile exists
set showbreak=              " Show for lines that have been wrapped, like Emacs
set showmatch               " Hilight matching braces/parens/etc.
set sidescrolloff=3         " Keep cursor away from this many chars left/right
set smartcase               " Lets you search for ALL CAPS
set softtabstop=4           " Spaces 'feel' like tabs
set suffixes+=.pyc          " Ignore these files when tab-completing
set tabstop=4               " The One True Tab
set textwidth=100           " 100 is the new 80
set notitle                 " Don't set the title of the Vim window
set wildmenu                " Show possible completions on command line
set wildmode=list:longest,full " List all options and complete
set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules  " Ignore certain files in tab-completion
set number										"show line numbers
"set relativenumber
" ----------------------------------------------------------------------------
" ABBREVATIONS
" ----------------------------------------------------------------------------

" Typing `$c` on the command line expands to `:e` + the current path, so it's easy to edit a file in
" the same directory as the current file.
cnoremap $c e <C-\>eCurrentFileDir()<CR>
function! CurrentFileDir()
   return "e " . expand("%:p:h") . "/"
endfunction

" I can't spell :(
abbr conosle console
abbr comopnent component

"vim jsx
let g:jsx_ext_required = 0

"Highlightin for class scope
let g:cpp_class_scope_highlight = 1

"Highlightin of template function
let g:cpp_experimental_template_highlight = 1

"unmap ex mode: 'Type visual to go into Normal mode'
nnoremap Q <nop>

" put git status, column/row number, total lines, and percentage in status
" set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]\ %=\%y\ %n\ %P

" if version >= 700
"   au InsertEnter * hi StatusLine ctermfg=237 ctermbg=2
"   au InsertLeave * hi StatusLine ctermbg=166 ctermfg=237
" endif

let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0

"change the GUI cursor
:filetype plugin on

" ----------------------------------------------------------------------------
" CUSTOM COMMANDS AND FUNCTIONS
" ----------------------------------------------------------------------------

" I always hit ":W" instead of ":w" because I linger on the shift key...
command! Q q
command! W w
command! Wq wq

" Trim spaces at EOL and retab. I run `:CLEAN` a lot to clean up files.
command! TEOL %s/\s\+$//
command! CLEAN retab | TEOL

" Close all buffers except this one
command! BufCloseOthers %bd|e#

" Highlight YAML frontmatter in Markdown files
let g:vim_markdown_frontmatter = 1

" ALE
"let g:ale_sign_warning = '▲'
"let g:ale_sign_error = '✗'
""highlight link ALEWarningSign String
""highlight link ALEErrorSign Title

"" Lightline
"let g:lightline = {
"\ 'colorscheme': 'solarized',
"\ 'active': {
"\   'left': [['mode', 'paste'], ['filename', 'modified']],
"\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
"\ },
"\ 'component_expand': {
"\   'linter_warnings': 'LightlineLinterWarnings',
"\   'linter_errors': 'LightlineLinterErrors',
"\   'linter_ok': 'LightlineLinterOK'
"\ },
"\ 'component_type': {
"\   'readonly': 'error',
"\   'linter_warnings': 'warning',
"\   'linter_errors': 'error'
"\ },
"\ }
"function! LightlineLinterWarnings() abort
  "let l:counts = ale#statusline#Count(bufnr(''))
  "let l:all_errors = l:counts.error + l:counts.style_error
  "let l:all_non_errors = l:counts.total - l:all_errors
  "return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
"endfunction
"function! LightlineLinterErrors() abort
  "let l:counts = ale#statusline#Count(bufnr(''))
  "let l:all_errors = l:counts.error + l:counts.style_error
  "let l:all_non_errors = l:counts.total - l:all_errors
  "return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
"endfunction
"function! LightlineLinterOK() abort
  "let l:counts = ale#statusline#Count(bufnr(''))
  "let l:all_errors = l:counts.error + l:counts.style_error
  "let l:all_non_errors = l:counts.total - l:all_errors
  "return l:counts.total == 0 ? '✓ ' : ''
"endfunction

"" Update and show lightline but only if it's visible (e.g., not in Goyo)
"autocmd User ALELint call s:MaybeUpdateLightline()
"function! s:MaybeUpdateLightline()
  "if exists('#lightline')
    "call lightline#update()
  "end
"endfunction


"File-type detection
augroup project
    autocmd!
    autocmd BufRead, BufNewFile *.h, *.c set filetype=c.doxygen
augroup END

"Multiple cursors mapping
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_quit_key='<Esc>'

" Use incsearch.vim to highlight as I search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'ag --vimgrep'

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'


"YCM global file
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_global_ycm_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"Do not ask when starting vim
let g:ycm_confirm_extra_conf = 0
let g:ycm_warning_symbol = '~'
nnoremap gt :tabnext<CR>
nnoremap tg :tabprev<CR>
let NERDTreeMapOpenInTab='<SPACE>'

"---------------------------------
"Custom functions C/C++
"---------------------------------

"compile and run single source file without leaving vim
autocmd filetype cpp nnoremap <leader>r :w <bar> exec '!g++ -std=c++17 -Wall -Wextra '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype c nnoremap <leader>r :w <bar> exec '!gcc -Wall'.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype ruby nnoremap <leader>r :w <bar> exec '!ruby '.shellescape('%')<CR>
autocmd filetype js nnoremap <leader>r :w <bar> exec '!/usr/bin/nodejs '.shellescape('%')<CR>
autocmd filetype lua nnoremap <leader>r :w <bar> exec '!/usr/bin/lua5.3 '.shellescape('%')<CR>
autocmd filetype jsx nnoremap <leader>r :w <bar> exec '!/usr/bin/nodejs '.shellescape('%')<CR>
autocmd filetype javascript.jsx nnoremap <leader>r :w <bar> exec '!/usr/bin/nodejs '.shellescape('%')<CR>

"auto C/C++ header files guards
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()
noremap <Leader>s :update<CR>
"switch between header/source with Ctr+2
map <C-2> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

"elimination delays on ESC in vim and zsh
set timeoutlen=1000 ttimeoutlen=0

function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  set bg=light
  if !has('gui_running')
    let g:solarized_termcolors=256
  endif
  colors solarized
endfunction

command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>

" Make sure colored syntax mode is on, and make it Just Work with 256-color terminals.
" ----------------------------------------------------------------------------
" COLORS
" ----------------------------------------------------------------------------

" Make sure colored syntax mode is on, and make it Just Work with 256-color terminals.
"set background=light
colorscheme dracula
let g:rehash256 = 1 " Something to do with Molokai?
"colorscheme molokai
if !has('gui_running')
  if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
  elseif has("terminfo")
    colorscheme default
    set t_Co=8
    set t_Sf=[3%p1%dm
    set t_Sb=[4%p1%dm
  else
    colorscheme default
    set t_Co=8
    set t_Sf=[3%dm
    set t_Sb=[4%dm
  endif
  " Disable Background Color Erase when within tmux - https://stackoverflow.com/q/6427650/102704
  if $TMUX != ""
    set t_ut=
  endif
endif
syntax on

" Window splits & ruler are too bright, so change to white on grey (non-GUI)
highlight StatusLine       cterm=NONE ctermbg=blue ctermfg=white
highlight StatusLineTerm   cterm=NONE ctermbg=blue ctermfg=white
highlight StatusLineNC     cterm=NONE ctermbg=black ctermfg=white
highlight StatusLineTermNC cterm=NONE ctermbg=black ctermfg=white
highlight VertSplit        cterm=NONE ctermbg=black ctermfg=white

" taglist.vim's filenames is linked to LineNr by default, which is too dark
highlight def link MyTagListFileName Statement
highlight def link MyTagListTagName Question

" Turn off horrible coloring for CDATA in XML
highlight def link xmlCdata NONE

" Some custom spell-checking colors
highlight SpellBad     term=underline cterm=underline ctermbg=NONE ctermfg=205
highlight SpellCap     term=underline cterm=underline ctermbg=NONE ctermfg=33
highlight SpellRare    term=underline cterm=underline ctermbg=NONE ctermfg=217
highlight SpellLocal   term=underline cterm=underline ctermbg=NONE ctermfg=72

" The Ignore color should be... ignorable
silent! highlight Ignore cterm=bold ctermfg=black ctermbg=bg
highlight clear FoldColumn
highlight def link FoldColumn Ignore
highlight clear Folded
highlight link Folded Ignore
highlight clear LineNr
highlight! def link LineNr Ignore

" Custom search colors
highlight clear Search
highlight Search term=NONE cterm=NONE ctermfg=white ctermbg=black

" Make hilighted matching parents less annoying
highlight clear MatchParen
highlight link MatchParen Search

" Custom colors for NERDTree
highlight def link NERDTreeRO NERDTreeFile

" Make trailing spaces very visible
"highlight SpecialKey ctermbg=dark guibg=dark

" Make menu selections visible
highlight PmenuSel ctermfg=black ctermbg=magenta

" The sign column slows down remote terminals
highlight clear SignColumn
highlight link SignColumn Ignore

" Markdown could be more fruit salady
highlight link markdownH1 PreProc
highlight link markdownH2 PreProc
highlight link markdownLink Character
highlight link markdownBold String
highlight link markdownItalic Statement
highlight link markdownCode Delimiter
highlight link markdownCodeBlock Delimiter
highlight link markdownListMarker Todo

"call ale#Set('cpp_gcc_executable', 'gcc')
"call ale#Set('cpp_gcc_options', '-std=c++14 -Wall')
