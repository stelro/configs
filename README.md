

**Installation**
```
$ cd ~
$ git clone https://github.com/stelro/dotfiles.git
$ ./dotfiles/script/install
```

**Update**
```
$ cd ~
$ ./dotfiles/script/update
```

**Used Plugins**
```
Vundle
NERDTree
NERDTree git plugins
Vim Fugitive
YouCompleteMe
Syntstic
Vim Airline
Vim GitGutter
Vim Snippets
Vim Multiple-Cursors
Vim C++ Enhanced Highlight
Vim Airline Themes
Vim Rails
Vim Ruby
Vim Javascript
Vim Coffee-Script
vim Surround
vim nerd-commenter
vim Endwise
Html5 Syntax

```

##Tmux
```
prefix key :							Ctr+a
```
##Vim
**Custom keybindings**
```
leader key							: comma (,)
NERDTree Toggle						        : Ctr-z
NERDTree open in tab						: Space
Multiple cursor next						: Ctr-d
Multiple cursor quit						: Esc
ctrlp invoke find file mode					: ,f
Run Ruby Test file						: ,t
Run Ruby Nearest test						: ,T
Compile And run							: ,r
Switch between header/source file				: Ctr-2
```

Vim auto-generate C/C++ header file Guards
```
#ifndef SOMEFILE_H	
#define SOMEFILE_H
..
..
#endif //SOMEFILE_H
```

##Vim / Gnome Terminal Color Schemes

Here are some color schemes i've used for an extended period of time and like. I am keeping them here as a reference to share 
with others and make it easier for me to siwtch back in the future.

To test your color sheme:

```
./script/colortest
```

##Gruvbox (Current Theme)

![Gruvbox](http://postimg.org/image/4lgztm4cx/)

**Vim** | [gruvbox](https://github.com/morhetz/gruvbox), by Thayer Williams

	let g:gruvbox_italic=1 before colorscheme gruvbox

**Colors used by Gnome Terminal**

![Railscasts1](https://camo.githubusercontent.com/cdb2f2e986c564b515c0c698e6c45b4ab5d725a9/687474703a2f2f692e696d6775722e636f6d2f776136363678672e706e67)

Typeface used by Terminal [Fira Mono](http://www.carrois.com/typefaces/FiraSans/#!layout=specimen)

##Railscasts Theme

![Railscast](http://s27.postimg.org/ng4sffkr7/railscast.png)

**Vim** | [Base16](https://github.com/chriskempson/base16-vim), by Chris Kempson

    $ cp railscasts/base16-railscasts.vim ~/.vim/colors/
    $ vim ~/.vimrc

      " ~/.vimrc
      set background=dark
      colorscheme base16-railscasts

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

**Colors used by Gnome Terminal**

![Railscasts1](http://s9.postimg.org/i2s5d4f9b/railscast1.png)

**Tmux config**

    $ vi ~/.tmux.conf

      # ~/.tmux.conf
      set -g default-terminal "screen-256color"
      set -g status-bg colour235
      set -g status-fg white

      set-window-option -g window-status-current-fg black
      set-window-option -g window-status-current-bg green

      set -g pane-border-fg colour235
      set -g pane-border-bg black
      set -g pane-active-border-fg green
      set -g pane-active-border-bg black

##Thayer Theme

![Thayer](http://s24.postimg.org/ebhxla6s5/thayer.png)

**Vim** | [Vimbrant](https://bitbucket.org/thayerwilliams/vimbrant/src/8abddd01c05e/vimbrant.vim), by Thayer Williams

    $ cp thayer/vimbrant.vim ~/.vim/colors/vimbrant.vim
    $ vim ~/.vimrc

      " ~/.vimrc
      set background=dark
      colorscheme vimbrant
      highlight ColorColumn ctermbg=7
      highlight ColorColumn guibg=Gray

**Colors used by Gnome Terminal**

![Railscasts1](http://s24.postimg.org/u9vp8j7bp/thayer1.png)

**Tmux config** | [Thayer (Vimbrant clone)](https://github.com/baskerville/iTerm-2-Color-Themes/blob/master/thayer.itermcolors), by Bastien Dejean

    $ vi ~/.tmux.conf

      # ~/.tmux.conf
      set -g status-bg colour235
      set -g status-fg white

      set-window-option -g window-status-current-fg black
      set-window-option -g window-status-current-bg green

      set -g pane-border-fg colour235
      set -g pane-border-bg black
      set -g pane-active-border-fg green
      set -g pane-active-border-bg black


