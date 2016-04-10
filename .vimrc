"setl
set encoding=utf-8
set nocompatible
filetype off

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'honza/vim-snippets'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'zenorocha/dracula-theme',{'rtp':'vim/'}
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'othree/html5-syntax.vim'
Plugin 'tpope/vim-endwise'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""
" generic , all buffer stuff "
""""""""""""""""""""""""""""""
syntax on
set mouse=a										"allow mouse in the buffer
set relativenumber						"show relative line numbers 
set number										"show line numbers
set ruler											"show row and column in footer
set visualbell								"enable visual bell (disable audio bell)
set showcmd										"show commands i am typing
set hlsearch									"highlight all search matches
set incsearch									"show search results as i type
set tw=120										"text warp 
set showmatch									"show bracket matches
set visualbell								"enable visal bell (disable audio bell)
set laststatus=2							"display status line always
set ts=2											"set indent on 2 spaces
set et												"expand tab
set numberwidth=3							"width of the gutter column used for numbering
set textwidth=0								"prevent vim from automatically inserting line breaks in newly entered text
set autoindent								"set auto ident
set smartindent								"set C ident
set tabstop=2									"tab stop in 2 tabs
set softtabstop=2
set shiftwidth=2
set noexpandtab
set cul												"hightlight the current line"
set clipboard=unnamed					"use the system clipboard
set history=1000							


" set leader key to comma
let mapleader = ","


"NERDTree key mapping
map <C-z> :NERDTreeToggle<CR>

"let g:airline_powerline_fonts = 1
"set guifont=Inconsolata\ for\ Powerline
"smarter tab line
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='powerlineish'
"Highlightin for class scope
let g:cpp_class_scope_highlight = 1

"Highlightin of template function
let g:cpp_experimental_template_highlight = 1

"unmap ex mode: 'Type visual to go into Normal mode'
nnoremap Q <nop>

" put git status, column/row number, total lines, and percentage in status
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]\ %=\%y\ %n\ %P

"set dark background and color scheme

colorscheme base16-railscasts
highlight Normal ctermbg=235 

 "set up some custom colors
highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=12
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" ctrlp config
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0

"change the GUI cursor
:filetype plugin on

"File-type detection
augroup project
    autocmd!
    autocmd BufRead, BufNewFile *.h, *.c set filetype=c.doxygen
augroup END

"Multiple cursors mapping
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_quit_key='<Esc>'

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
autocmd filetype cpp nnoremap <leader>r :w <bar> exec '!g++ -std=c++14 -Wall -Wextra '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype c nnoremap <leader>r :w <bar> exec '!gcc -Wall'.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype ruby nnoremap <leader>r :w <bar> exec '!ruby '.shellescape('%')<CR>

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

"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = 'std=c++11 -stdlib-libc++'

"---------------------------------
"Custom functions Ruby on Rails
"---------------------------------

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !clear
  if match(a:filename, '\.feature$') != -1
    exec ":!bundle exec cucumber " . a:filename
  elseif match(a:filename, '_test\.rb$') != -1
    if filereadable("script/testrb")
      exec ":!script/testrb " . a:filename
    else
      exec ":!ruby -Itest " . a:filename
    end
  else
    if filereadable("Gemfile")
      exec ":!bundle exec rspec --color " . a:filename
  else
      exec ":!rspec --color " . a:filename
    end
  end
endfunction

function! SetTestFile()
  " set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number . " -b")
endfunction

" run test runner
map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>

"switch between header/source with Ctr+2
map <C-2> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

"elimination delays on ESC in vim and zsh
set timeoutlen=1000 ttimeoutlen=0

" unmap F1 help
nmap <F1> <nop>
imap <F1> <nop>

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
