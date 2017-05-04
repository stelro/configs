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
Plugin 'jistr/vim-nerdtree-tabs'
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
Plugin 'fholgado/minibufexpl.vim'
Plugin 'adimit/prolog.vim'

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
set ts=4											"set indent on 2 spaces
set et												"expand tab
set numberwidth=3							"width of the gutter column used for numbering
set textwidth=0								"prevent vim from automatically inserting line breaks in newly entered text
set autoindent								"set auto ident
set smartindent								"set C ident
set tabstop=4									"tab stop in 2 tabs
set softtabstop=4
set shiftwidth=4
set noexpandtab
set cul												"hightlight the current line"
set clipboard=unnamed					"use the system clipboard
set history=1000							


" set leader key to comma
let mapleader = ","

"NERDTree key mapping
map <C-z> :NERDTreeToggle<CR>

"Highlightin for class scope
let g:cpp_class_scope_highlight = 1

"Highlightin of template function
let g:cpp_experimental_template_highlight = 1

"unmap ex mode: 'Type visual to go into Normal mode'
nnoremap Q <nop>

" put git status, column/row number, total lines, and percentage in status
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]\ %=\%y\ %n\ %P

"set dark background and color scheme
color dracula

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
autocmd filetype js nnoremap <leader>r :w <bar> exec '!node '.shellescape('%')<CR>

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

" unmap F1 help
nmap <F1> <nop>
imap <F1> <nop>

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
