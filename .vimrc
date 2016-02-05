"setl
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
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'honza/vim-snippets'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'zenorocha/dracula-theme',{'rtp':'vim/'}
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-surround'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""
" generic , all buffer stuff "
""""""""""""""""""""""""""""""
set mouse=a				"allow mouse in the buffer
set number				"show line numbers 
set ruler				"show row and column in footer
set noeol
set binary
set showcmd
set tw=80				"text warp 
set showmatch			"show bracket matches
set visualbell			"enable visal bell (disable audio bell)
set laststatus=2		
set autoread
set ts=2				"set indent on 4 spaces
set sw=2
set et
set numberwidth=3
set textwidth=0
set autoindent			"set auto ident
set cindent				"set C ident
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

set laststatus=2
"sets how many lines of history VIM has to remember
set history=1000

"set to auto to read when a file is changed from the outside
set autoread

" set leader key to comma
let mapleader = ","

"open NERDTree on startup
"autocmd vimenter * NERDTree
"NERDTree key mapping
map <C-z> :NERDTreeToggle<CR>

let g:airline_powerline_fonts = 1
set guifont=Inconsolata\ for\ Powerline
"smarter tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
"Highlightin for class scope
let g:cpp_class_scope_highlight = 1

"Highlightin of template function
let g:cpp_experimental_template_highlight = 1


" put git status, column/row number, total lines, and percentage in status
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]

syntax on
:set  t_Co=256

set background=dark
colorscheme vimbrant
highlight ColorColumn ctermbg=7
highlight ColorColumn guibg=Gray

"set dark background and color scheme

"colorscheme base16-railscasts
"highlight Normal ctermbg=235 

" set up some custom colors
"highlight clear SignColumn
"highlight VertSplit    ctermbg=236
"highlight ColorColumn  ctermbg=237
"highlight LineNr       ctermbg=236 ctermfg=240
"highlight CursorLineNr ctermbg=236 ctermfg=240
"highlight CursorLine   ctermbg=236
"highlight StatusLineNC ctermbg=238 ctermfg=0
"highlight StatusLine   ctermbg=240 ctermfg=12
"highlight IncSearch    ctermbg=3   ctermfg=1
"highlight Search       ctermbg=1   ctermfg=3
"highlight Visual       ctermbg=3   ctermfg=0
"highlight Pmenu        ctermbg=240 ctermfg=12
"highlight PmenuSel     ctermbg=3   ctermfg=1
"highlight SpellBad     ctermbg=0   ctermfg=1

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" highlight trailing spaces in annoying red
"highlight ExtraWhitespace ctermbg=1 guibg=red
"match ExtraWhitespace /\s\+$/
"autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave * call clearmatches()

set guifont=Menlo\ 12

"colorscheme solorized
"set background=dark
"colorscheme solarized
"solarized for terminal users
"let g:solarized_termcolors=256

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

"auto C/C++ header files guards
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()



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
